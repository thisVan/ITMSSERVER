package org.south.itms.dao.impl;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Table;

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

/**
 * @author: yezilong
 */

@Repository("ptableDao")
public class PtableDaoImpl implements PtableDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
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
		SqlUpdate su = new SqlUpdate();
		su.updateFile(pid, nums);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void updateTableStatus(String pid) {
		String hql = "from PlayTable where pid=? and deleted=0";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, pid);
		PlayTable pt = (PlayTable) query.uniqueResult();
		pt.setStatusId("2");
		this.getCurrentSession().update(pt);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void updateTableStatusFinal(String pid) {
		String hql = "from PlayTable where pid=? and deleted=0";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, pid);
		PlayTable pt = (PlayTable) query.uniqueResult();
		pt.setStatusId("3");
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
	public void updateTableStatusFinalUn(String pid, String mark) {
		String hql = "from PlayTable where pid=? and deleted=0";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, pid);
		PlayTable pt = (PlayTable) query.uniqueResult();
		pt.setStatusId("4");
		pt.setMark(mark);
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
	public void playTableUnAccess(String pid, String statusId) {
		String hql = "from PlayTable where pid=? and deleted=0";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, pid);
		PlayTable pt = (PlayTable) query.uniqueResult();
		pt.setStatusId(statusId);
		this.getCurrentSession().update(pt);
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
	public void modifyPlayTableNumbyDelAll(String ppid, String sortNum) {
		// TODO Auto-generated method stub
		String[] nums = sortNum.split(",");
		TableAutoGenerate tableAutoGenerate=new TableAutoGenerate();
		tableAutoGenerate.delAllSqlPlayFile(ppid);
		SqlUpdate su = new SqlUpdate();
		su.updateFilebydelAll(ppid, nums);
		
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

	
	
}
