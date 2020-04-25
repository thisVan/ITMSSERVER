package org.south.itms.dao.impl;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.SchemaOutputResolver;

import com.alibaba.fastjson.JSON;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.south.itms.entity.File;
import org.south.itms.entity.IPTable;
import org.south.itms.entity.Material;
import org.south.itms.entity.PlayTable;
import org.south.itms.util.SqlUpdate;
import org.south.itms.util.StringUtil;
import org.south.netty.NettyChannelMap;
import org.south.netty.TableAutoGenerate;
import org.south.netty.msg.DataKey;
import org.south.netty.msg.InsertDto;
import org.south.netty.msg.MsgType;
import org.south.netty.msg.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @author: yezilong
 */

@Repository
public class PtableDaoImpl implements PtableDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		if (this == null){
			System.out.println("this null");
		}
		if (this.sessionFactory == null){
			System.out.println("this.sessionFactory null");
		}
		return this.sessionFactory.getCurrentSession();
	}
	
    private Session openSession() {  
        return this.sessionFactory.openSession();  
    }  
    
    
    //关闭Session
    private void closeSession(Session session){
        if(null != session){
            session.close();
        }
    }
	
	
    @Override  
    public List<PlayTable> findAllPlayTable() {  
        return this.getCurrentSession().createQuery("from PlayTable where deleted = 0").list();  
    }  
    
	
	
    @Override  
    public int countByName(PlayTable entity) {
    	String hqlString = "select count(*) from PlayTable where deleted = 0 and pid != :pid";  
    	Query query = this.getCurrentSession().createQuery(hqlString);  
    	query.setParameter("pid", entity.getPid());
    	return ((Number)query.uniqueResult()).intValue();
    }
    
	
    
    @Override  
    public String save(PlayTable entity) {  
    	return (String)this.getCurrentSession().save(entity);
    }  

    
	@Override
	public void delete(String id) {
		String hql = "update PlayTable set deleted = 1 where pid=:pid";
		this.getCurrentSession().createQuery(hql).setParameter("pid", id).executeUpdate();
	} 
	
	@Override
	public void updateAllTime(String pid, String allTime, String screenRate) {
		String hql = "update PlayTable set playTotalTime = :allTime, screenRate = :screenRate where pid = :pid";
		this.getCurrentSession().createQuery(hql).setParameter("allTime", allTime).setParameter("screenRate", screenRate).setParameter("pid", pid).executeUpdate();
	}
	
    
	@Override  
    public PlayTable get(String id) {  
		return (PlayTable) this.getCurrentSession().get(PlayTable.class, id);  
    }  
	

    @Override  
    public PlayTable load(String id) {  
        return (PlayTable) this.getCurrentSession().load(PlayTable.class, id);  
    }  
    
    
	@Override
	public void savePtableFileRelation(String pid, String[] fileIds) {  
		String sql = "insert into ptable_file(pid, file_id, num, deleted) values (:pid, :fileId, :num, 0)";
		Query query = this.getCurrentSession().createNativeQuery(sql);
		query.setParameter("pid", pid);
		for(int i = 0; i < fileIds.length; i++) {
			query.setParameter("fileId", fileIds[i]);
			query.setParameter("num", i);
			query.executeUpdate();
		}
	} 
    
	@Override
	public void delPtableFileRelation(String pid) {
		String sql = "delete from ptable_file where pid = :pid";
		this.getCurrentSession().createNativeQuery(sql).setParameter("pid", pid).executeUpdate();
	}

	@Override
	public void modifyPlayTableNum(String pid, String sortNum) {
//		int[] pfileId = new int[list.size()];
//		int len = 1;
//		for(int i = 1; i <= list.size(); i++) {
//			String sql = "select a.id from ptable_file a where a.pid=" + Integer.parseInt(pid) +
//					" and a.deleted = 0  and a.num = " + i +" and a.file_id = " + Integer.parseInt(list.get(i - 1).getFileId());
//			Query query = this.getCurrentSession().createNativeQuery(sql);  
//	        List<BigInteger> ids = (List<BigInteger>)(query.getResultList());
//	        pfileId[len - 1] = Integer.parseInt(ids.get(0).toString());
//	        len++;
//		}
//		for(int k : pfileId) {
//			System.out.print(k + " ");
//		}
//		System.out.println();
		String[] nums = sortNum.split(",");

		System.out.println("修改顺序的sortNum如下: ");
		System.out.println(nums);
		SqlUpdate su = new SqlUpdate();
		su.updateFile(pid, nums);
	}

	@Override
	public void modifyPlayTableNumByMidSortAndItemIdSort(String pid, String sortNum, String itemIdSort) {
		String[] nums = sortNum.split(",");
		String[] itemIds = itemIdSort.split(",");

		System.out.println("修改顺序的两个num如下: ");
		System.out.println(nums);
		System.out.println(itemIds);

		SqlUpdate su = new SqlUpdate();
		su.updateFile(pid, nums,itemIds);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void updateTableStatus(String pid) throws ParseException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String userName = (String) request.getSession().getAttribute("userName");

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Date date = df.parse(df.format(new Date()));

		String hql = "from PlayTable where pid=? and deleted=0";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, pid);
		PlayTable pt = (PlayTable) query.uniqueResult();
		pt.setStatusId("2");
		pt.setCheckName(userName);
		pt.setCheckTime(date);
		this.getCurrentSession().update(pt);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void updateTableStatusFinal(String pid) throws ParseException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String userName = (String) request.getSession().getAttribute("userName");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Date date = sdf.parse(sdf.format(new Date()));

		String hql = "from PlayTable where pid=? and deleted=0";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, pid);
		PlayTable pt = (PlayTable) query.uniqueResult();
		pt.setStatusId("3");
		pt.setCheckSecondName(userName);
		pt.setCheckSecondTime(date);
		this.getCurrentSession().update(pt);
		
		//插播到客户端
		if(pt.getInsertFlag() == 1) {
			System.out.println("channel=" + NettyChannelMap.get(pt.getTerminalId()));
			System.out.println("=" + (new Date()).equals(pt.getPlayDate()));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			String now = df.format(new Date());
			String setDate = df.format(pt.getPlayDate());
			System.out.println(now + "=" + setDate);
			boolean dateCheck = now.equals(setDate);
			if(dateCheck && NettyChannelMap.get(pt.getTerminalId()) != null) {
				ResultMsg resultMsg = new ResultMsg(true, MsgType.InsertMaterial);
				Map<String, Object> data = new HashMap<String, Object>();
				List<InsertDto> insertDto = new ArrayList<InsertDto>();
				List<String> midds = new ArrayList<String>();
				int sum = 0;
				List<String> fileName = new ArrayList<String>();
				List<Material> listM = getMaterialByPid(pt.getPid());
	       		List<String> logicName = new ArrayList<String>();
        		List<String> md5 = new ArrayList<String>();
				for(Material m : listM) {
					midds.add(m.getMid());
	    			String[] insertFileName = m.getFilePath().split("/");
	    			fileName.add(insertFileName[insertFileName.length - 1]);
	    			logicName.add(m.getMaterialName());
        			md5.add(m.getMd5());
	    			sum = sum + m.getDuration();
				}
				InsertDto dto = new InsertDto();
				dto.setEnd(format.format(pt.getEndTime()));
	        	dto.setStart(format.format(pt.getStartTime()));
	        	dto.setStatus("" + pt.getState());
	        	dto.setMin("" + pt.getMin());
	        	dto.setDuration("" + sum);
	        	dto.setMid(midds);
	        	dto.setFileName(fileName);
	        	dto.setLogicName(logicName);
            	dto.setMd5(md5);
	        	insertDto.add(dto);
	        	data.put(DataKey.insertfiles, insertDto);
	        	resultMsg.setData(data);
	        	System.out.println("resultMsg=" + resultMsg);
				NettyChannelMap.get(pt.getTerminalId()).writeAndFlush(resultMsg);
			}
		}				
	}
	
	public List<Material> getMaterialByPid(String pid){
		Session session = openSession();
        try {
        	String sql = "select m.* from ptable_file pf left join material m on pf.mid = m.mid where m.deleted = 0 and pf.deleted = 0 and pf.pid = :pid order by pf.num asc";
        	return session.createNativeQuery(sql, Material.class).setParameter("pid", pid).getResultList();
        } finally {
            closeSession(session);
        }
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public void updateTableStatusFinalUn(String pid, String mark) throws ParseException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String userName = (String) request.getSession().getAttribute("userName");

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Date date = df.parse(df.format(new Date()));

		String hql = "from PlayTable where pid=? and deleted=0";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, pid);
		PlayTable pt = (PlayTable) query.uniqueResult();
		pt.setStatusId("4");
		pt.setMark(mark);
		pt.setCheckSecondName(userName);
		pt.setCheckSecondTime(date);
		this.getCurrentSession().update(pt);
	}

//	public void saveInsertTable(IPTable insertTable) {
//		this.getCurrentSession().save(insertTable);
//	}

	@Override
	public void saveTable(IPTable insert) {
//		String sql = "insert into insert_table(insert_date, start_time, end_time, interval, file_id, terminal_id, create_name, create_time, deleted) values (:insertDate, :startTime, :endTime, :interval, :fileId, :terminalId, :createName, :createTime, 0)";
//		Query query = this.getCurrentSession().createNativeQuery(sql);
//		query.setParameter("insertDate", insert.getInsertDate());
//		query.setParameter("startTime", insert.getStartTime());
//		query.setParameter("endTime", insert.getEndTime());
//		query.setParameter("interval", insert.getInterval());
//		query.setParameter("fileId", insert.getFileId());
//		query.setParameter("terminalId", insert.getTerminalId());
//		query.setParameter("createName", insert.getCreateName());
//		query.setParameter("createTime", insert.getCreateTime());
//		query.executeUpdate();
		//SqlUpdate sq = new SqlUpdate();
		//sq.saveInsertTable(insert);
		this.getCurrentSession().save(insert);
	}

	@Override
	public void saveInsertTable(IPTable insert) {
		SqlUpdate sq = new SqlUpdate();
		sq.saveInsertTable(insert);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void playTableUnAccess(String pid, String statusId) throws ParseException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String userName = (String) request.getSession().getAttribute("userName");

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Date date = df.parse(df.format(new Date()));


		System.out.println("不通过！！！！pid" + pid + " statusId: "+statusId);
		// modify by bobo 2020/3/13
		//尽量部分更新好
		try{
			Session session = this.getCurrentSession();
			Query query = session.createQuery("update PlayTable set statusId = :statusId,checkName = :userName," +
					"checkTime = :date  where pid = :pid and deleted = 0");
			query.setParameter("statusId",statusId);
			query.setParameter("userName",userName);
			query.setParameter("date",date);
			query.setParameter("pid",pid);
			query.executeUpdate();
			session.clear();

		}catch (Exception e){
			e.printStackTrace();
		}

//		String hql = "from PlayTable where pid=? and deleted=0";
//		Query query = this.getCurrentSession().createQuery(hql);
//		query.setParameter(0, pid);
//		PlayTable pt = (PlayTable) query.uniqueResult();
//		pt.setStatusId(statusId);
//		pt.setCheckName(userName);
//		pt.setCheckTime(date);
//		this.getCurrentSession().update(pt);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<PlayTable> getTableById(String statusId) {
		String hql = "from PlayTable where statusId = ? and deleted = ?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, statusId);
		query.setParameter(1, 0);
		List<PlayTable> list = query.list();
		return list;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public PlayTable getById(String pid) {
		String hql = "from PlayTable where pid = ? and deleted = ?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, pid);
		query.setParameter(1, 0);
		return (PlayTable) query.uniqueResult();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void resetPtableState(String pid) {
		String hql1 = "from PlayTable where pid = ?";
		Query query = this.getCurrentSession().createQuery(hql1);
		query.setParameter(0, pid);
		PlayTable ptable = (PlayTable) query.uniqueResult();
		ptable.setStatusId("1");
		this.getCurrentSession().update(ptable);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<PlayTable> getTableByTwoId(String statusId1, String statusId2) {
		String hql = "from PlayTable where (statusId = ? or statusId = ?) and deleted = 0";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, statusId1);
		query.setParameter(1, statusId2);
		List<PlayTable> list = query.list();
		return list;
	}

	//7.15
	@Override
	public void modifyPlayTableNumbyDelAll(String ppid, String sortNum,String itemIdSeq) {
		// TODO Auto-generated method stub

		// modify by bobo 2020/4/18
		// 新增itemIds
		String[] nums = sortNum.split(",");
		String[] itemIds = itemIdSeq.split(",");
		TableAutoGenerate tableAutoGenerate=new TableAutoGenerate();
		tableAutoGenerate.delAllSqlPlayFile(ppid);
		SqlUpdate su = new SqlUpdate();
		su.updateFilebydelAll(ppid, nums, itemIds);
		
	}
	
	//2018.11.27
	@Override
	public List<PlayTable> findPlayTable(String terminalId, String startTime, String endTime, String statusId){
		String hql = "from PlayTable where deleted = 0";
		if (!StringUtil.isEmpty(terminalId)) {
		 	hql += " and terminalId = " + terminalId;
		}
		if (!StringUtil.isEmpty(startTime)) {
		 	hql += " and playDate >= '" + startTime + "'";
		}
		if (!StringUtil.isEmpty(endTime)) {
		 	hql += " and playDate <= '" + endTime + "'";
		}
		if (!StringUtil.isEmpty(statusId)) {
		 	hql += " and statusId = " + statusId;
		}	
		
		Query query = this.getCurrentSession().createQuery(hql);
		List<PlayTable> list = query.list();
		return list;

	}
	
	@Override
	public List<PlayTable> findInsertByTerminalId(String terminalId) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Session session = openSession();
        List<PlayTable> list = session.createQuery("from PlayTable where deleted = 0 and terminalId = :terminalId and playDate = :playDate and insertFlag = :insertFlag and statusId = :statusId")
        		.setParameter("terminalId", terminalId)
        		.setParameter("playDate", d)
        		.setParameter("insertFlag", 1)
        		.setParameter("statusId", "3")
        		.getResultList(); 
        closeSession(session);
        return list;
	}

	@Override
	public List<PlayTable> findByTerminalId(String terminalId) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Session session = openSession();
        List<PlayTable> list = session.createQuery("from PlayTable where deleted = 0 and terminalId = :terminalId and playDate = :playDate and statusId = :statusId")
        		.setParameter("terminalId", terminalId)
        		.setParameter("playDate", d)
        		.setParameter("statusId", "3")
        		.getResultList(); 
        closeSession(session);
        return list;
	}
	
	@Override
	public List<Material> findAllMaterialByPlayTableId(String pid) {
		Session session = openSession();
		try {
        	String sql = "select m.* from material m left join ptable_file pf on m.mid = pf.mid where pf.pid = :pid and pf.deleted = 0 and m.deleted = 0";
        	List<Material> listMaterial = session.createNativeQuery(sql, Material.class).setParameter("pid", pid).list();
        	return listMaterial;
		} finally {
            closeSession(session);
        }
	}

	@Override
	public List<Material> findAllMaterialByPlayTableIdAndType(String pid, String file_type) {
		Session session = openSession();
		try {
        	String sql = "select m.* from material m left join ptable_file pf on m.mid = pf.mid where pf.pid = :pid and pf.deleted = 0 and m.deleted = 0 and m.fileType = :file_type";
        	List<Material> listMaterial = session.createNativeQuery(sql, Material.class).setParameter("pid", pid).setParameter("file_type", file_type).list();
        	return listMaterial;
		} finally {
            closeSession(session);
        }
	}

	@Override
	public void updateUnAccessReason(String pid, String reason) {

		Session session = this.getCurrentSession();
		session.clear();
		String hql = "update PlayTable set un_access_reason= :reason where pid=:pid";
		session.createQuery(hql).setParameter("pid", pid).setParameter("reason",reason).executeUpdate();
		session.clear();

	}

	// 播表组机制
	// 给定一个播表ID， 能找出所有 符合：
	// 1.与其同组
	// 2.符合审核层次
	// 的播表信息
	@Override
	public List<PlayTable>  getPtableGroupAndMembers(String pid,int checkKind) {

		// checkKind 是一级还是二级审核还是其他操作
		// 用于区分

		System.out.println("进入： 获取组ID和成员");
		Session session = this.getCurrentSession();

		// 查组ID
		String sql = "select ptg.play_table_group_id from play_table_group ptg where ptg.pid = :pid ";
		List groupId = session.createNativeQuery(sql).setParameter("pid", pid).getResultList();
		System.out.println(groupId);

		// 查该组ID对应的Pid
		String sql2 = "select ptg.pid from play_table_group ptg where ptg.play_table_group_id = :groupId ";
		List<String> pids = session.createNativeQuery(sql2).setParameter("groupId", groupId).getResultList();
		System.out.println(pids);


		// 分类，播表一级和二级和其他操作
		List<PlayTable> playTableList = new ArrayList<>();

		// 其他操作如修改顺序
		if (checkKind == 0){
			try {
				String sql3 = "select pt.* from play_table pt where  pt.deleted = 0 and pt.pid = :pid";

				List<PlayTable> tempList;
				for (int i = 0 ; i < pids.size() ; i++){
					tempList =session.createNativeQuery(sql3)
							.setParameter("pid",pids.get(i)).addEntity(PlayTable.class).list();
					//System.out.println(tempList);
					if(tempList.size() != 0) {
						playTableList.add(tempList.get(0));
					}
				}
				// 找出了所有符合条件的播表
				System.out.println(playTableList);
				//System.out.println("json: " + JSON.toJSONString(playTableList));

			}catch (Exception e){
				e.printStackTrace();
			}
		}
		// 播表一级审核
		else if (checkKind == 1){
			try {
				String sql3 = "select pt.* from play_table pt where  pt.deleted = 0 and pt.pid = :pid and pt.status_Id = :status_id ";

				List<PlayTable> tempList;
				for (int i = 0 ; i < pids.size() ; i++){
					tempList =session.createNativeQuery(sql3)
							.setParameter("status_id", checkKind)
							.setParameter("pid",pids.get(i)).addEntity(PlayTable.class).list();
					//System.out.println(tempList);
					if(tempList.size() != 0) {
						playTableList.add(tempList.get(0));
					}
				}
				// 找出了所有符合条件的播表
				System.out.println(playTableList);
				//System.out.println("json: " + JSON.toJSONString(playTableList));

			}catch (Exception e){
				e.printStackTrace();
			}
		}
		// 播表二级审核
		else if (checkKind == 2){
			try {
				String sql3 = "select pt.* from play_table pt where  pt.deleted = 0 and pt.pid = :pid and pt.status_Id = :status_id ";

				List<PlayTable> tempList;
				for (int i = 0 ; i < pids.size() ; i++){
					tempList =session.createNativeQuery(sql3)
							.setParameter("status_id", checkKind)
							.setParameter("pid",pids.get(i)).addEntity(PlayTable.class).list();
					//System.out.println(tempList);
					if(tempList.size() != 0) {
						playTableList.add(tempList.get(0));
					}
				}
				// 找出了所有符合条件的播表
				System.out.println(playTableList);
				//System.out.println("json: " + JSON.toJSONString(playTableList));

			}catch (Exception e){
				e.printStackTrace();
			}



		}
		else{

		}

		return playTableList;


	}

	@Override
	public void saveInsertPlayTableGroup(List<String> pids) {

		System.out.println("建立插播播表组");
		Session session = this.getCurrentSession();

		long groupId = System.currentTimeMillis();

		for (int i = 0 ; i < TableAutoGenerate.insertPlayTableAutoIdList.size() ;i++){
			long temp = Long.parseLong(TableAutoGenerate.insertPlayTableAutoIdList.get(i));
			String sql = "insert into play_table_group(play_table_group_id, pid) values ("+groupId+", " + temp+")";
			Query query = this.getCurrentSession().createNativeQuery(sql);
			query.executeUpdate();
		}

		TableAutoGenerate.insertPlayTableAutoIdList.clear();
	}


}
