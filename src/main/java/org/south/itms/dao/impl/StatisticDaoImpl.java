package org.south.itms.dao.impl;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.hibernate.type.StandardBasicTypes;
import org.south.itms.dto.Page;
import org.south.itms.dto.PlayNumDto;
import org.south.itms.dto.ValueParam;
import org.south.itms.entity.PlayLog;
import org.south.itms.util.SqlUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.SetFactoryBean;
import org.springframework.stereotype.Repository;  
  
/**
 * @author: yezilong
 */
@Repository("statisticDao")  
public class StatisticDaoImpl implements StatisticDao {  
  
    @Autowired  
    private SessionFactory sessionFactory;  
  
    private Session getCurrentSession() {  
        return this.sessionFactory.getCurrentSession();  
    }  
  
    private Session openSession() {  
        return this.sessionFactory.openSession();  
    }  
    
    
    @Override 
    public List<PlayNumDto> findPlayNumDto(String terminalId, String startTime, String endTime) {
    	String sql = "select material_name materialName, count(*) playNum, min(play_start_time) startPlayTime, max(play_end_time) endPlayTime from play_log where deleted = 0  and terminal_id = :terminalId and str_to_date(play_start_time, '%Y-%m-%d %H:%i:%S') >= :startTime and str_to_date(play_end_time, '%Y-%m-%d %H:%i:%S') <= :endTime group by file_id";
        List list = getCurrentSession().createSQLQuery(sql).setParameter("terminalId",terminalId).setParameter("startTime",startTime).setParameter("endTime",endTime).
                addScalar("materialName",StandardBasicTypes.STRING).  
                addScalar("playNum", StandardBasicTypes.INTEGER).  
                addScalar("startPlayTime",StandardBasicTypes.STRING).
                addScalar("endPlayTime",StandardBasicTypes.STRING).list();  
        
        List<PlayNumDto> result = new ArrayList<PlayNumDto>();
        for(Iterator iterator = list.iterator();iterator.hasNext();){  
               //每个集合元素都是一个数组
              Object[] objects = (Object[]) iterator.next();  
              result.add(new PlayNumDto((String)objects[0], (Integer)objects[1], (String)objects[2], (String)objects[3]));
        }

        return result;
    }
    
    /**
     * 查询播放次数
     */
    @Override 
	public List<PlayNumDto> findPlayNumDto(String terminalId, String startTime, String endTime, String materialName) {
		String sql = "select material_name materialName, count(*) playNum, min(play_start_time) startPlayTime, max(play_end_time) endPlayTime from play_log where deleted = 0 and terminal_id = :terminalId and str_to_date(play_start_time, '%Y-%m-%d %H:%i:%S') >= :startTime and str_to_date(play_end_time, '%Y-%m-%d %H:%i:%S') <= :endTime and material_name like :materialName group by file_id";
		List list = getCurrentSession().createSQLQuery(sql).setParameter("terminalId", terminalId).setParameter("startTime", startTime)
				.setParameter("endTime", endTime).setParameter("materialName", "%" + materialName + "%")
				.addScalar("materialName", StandardBasicTypes.STRING).addScalar("playNum", StandardBasicTypes.INTEGER)
				.addScalar("startPlayTime", StandardBasicTypes.STRING).addScalar("endPlayTime", StandardBasicTypes.STRING).list();

		List<PlayNumDto> result = new ArrayList<PlayNumDto>();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			// 每个集合元素都是一个数组
			Object[] objects = (Object[]) iterator.next();
			result.add(new PlayNumDto((String) objects[0], (Integer) objects[1], (String) objects[2], (String) objects[3]));
		}


		return result;
	}
    
    /**
     * 分页查询播放日志
     */
	@Override
	public Page pageSearchPlayLog(String terminalId, String material_name, String startTime, String endTime, int currentPage, int pageSize) { // 分页查询
		if (pageSize < 1) {
			pageSize = 20;
		}
		String sql = "select * from play_log where deleted = 0 "
				+ "and terminal_id = :terminalId ";
		if (material_name != null && !"".equals(material_name)) {
			sql += "and material_name like :material_name ";
		}
		sql += "and play_start_time >= :startTime "
				+ "and play_end_time <= :endTime ORDER BY play_end_time desc";
		// 先计算出在数据库总共有多少条数据
		Query countQuery = getCurrentSession().createNativeQuery(sql, PlayLog.class);
		countQuery.setParameter("terminalId", terminalId);
		countQuery.setParameter("startTime", startTime);
		countQuery.setParameter("endTime", endTime);
		if (material_name != null && !"".equals(material_name)) {
			countQuery.setParameter("material_name", "%" + material_name + "%");
		}
		
		int totalRecord = countQuery.list().size();
		//int totalRecord = Integer.valueOf(countQuery.uniqueResult() + "");
		int totalPage = totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1;
		
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		if (currentPage < 1) {
			currentPage = 1;
		}
		// 再获取某页的数据
		Query<PlayLog> query = getCurrentSession().createNativeQuery(sql, PlayLog.class);
		query.setParameter("terminalId", terminalId);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		if (material_name != null && !"".equals(material_name)) {
			query.setParameter("material_name", "%" + material_name + "%");
		}
		query.setFirstResult(pageSize * (currentPage - 1));
		query.setMaxResults(pageSize);
		List list = query.list();

		// 把结果包装成page返回
		return new Page(currentPage, totalPage, pageSize, totalRecord, list);
	}
    
    @Override 
    public List<PlayLog> findPlayLog(String terminalId, String startTime, String endTime,String materialNameLike) {
		String sql = "";
		if (materialNameLike.equals("")) {
			sql = "select * from play_log where deleted = 0  and terminal_id = :terminalId and str_to_date(play_start_time, '%Y-%m-%d %H:%i:%S') >= :startTime and str_to_date(play_end_time, '%Y-%m-%d %H:%i:%S') <= :endTime ORDER BY play_end_time desc";
			return getCurrentSession().createNativeQuery(sql, PlayLog.class).setParameter("terminalId", terminalId).setParameter("startTime", startTime).setParameter("endTime", endTime).getResultList();

		}
		else{
			materialNameLike = "%" + materialNameLike + "%";
			sql = "select * from play_log where deleted = 0 and material_name like :materialNameLike and terminal_id = :terminalId and str_to_date(play_start_time, '%Y-%m-%d %H:%i:%S') >= :startTime and str_to_date(play_end_time, '%Y-%m-%d %H:%i:%S') <= :endTime ORDER BY play_end_time desc";
			return getCurrentSession().createNativeQuery(sql, PlayLog.class).setParameter("terminalId", terminalId).setParameter("startTime", startTime).setParameter("endTime", endTime).setParameter("materialNameLike",materialNameLike).getResultList();


		}
    }
  
    
  
}  