package org.south.itms.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.south.itms.entity.*;
import org.south.itms.dto.Page;

public interface CommonService {

	void updateByHQL(String hql);

	void updateByTemplateHQL(String hql, Map<String, String> paramMap, Map<String, String> whereMap);

	Page pageSearchByTemplateHQL(String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
	Page pageSearchByTemplateHQL(String start, String end, String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
	Page pageSearchPtableByTemplateHQL(String start, String end, String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
	
	//add by bobo 
	//2019/11/20
	//这个系统中的 HQL模板设计有问题，不够完全抽象，只抽象了部分。在生成HQL模板时，按时间范围的查找很麻烦！所以我只能再添加一个查UserActionLog的
	Page pageSearchUserActionLogByTemplateHQL(String start, String end, String[] params, int currentPage, int pageSize,String className, String orderBy, String whereSuffix);
	
	Page pageSearchMaterialByTemplateHQL(String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
	
	Page pageSearchByTemplateHQLTree(String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);

	Page pageSearchFirstByTemplateHQL(String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
	
	Page pageSearchInsertByTemplateHQL(String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);

	Page pageSearchSecondByTemplateHQL(String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
    //7.16
	Page pageSearchByTemplateHQL(String[] params, String alreadymid,int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
	void saveVideoFile(org.south.itms.entity.File upload);

	void delFile(String[] fileId);

	void editFile(String fId, String newFilePath, String name);

	boolean queryByName(String fileName);

	void updateByName(String fId, String name, int fre, String terId);

	List<Terminal> getAllTerminal();

	Page pageSearchCheckByTemplateHQL(String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
	Page pageSearchCheckByTemplateHQL(String startDate, String endDate, String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);
	/**
	 * @param fileId
	 * @param timestamp 
	 * @param name 
	 */
	void firstCheckFile(String fileId, String name, Timestamp timestamp);

	/**
	 * @param fileId
	 * @param timestamp 
	 * @param name 
	 */
	void firstUncheckFile(String fileId, String name, Timestamp timestamp);

	Page pageSearchCheckFinalByTemplateHQL(String[] params, int currentPage, int pageSize, String className, String orderBy, String whereSuffix);

	/**
	 * @param fileId
	 * @param timestamp 
	 * @param name 
	 */
	void secondCheckFile(String fileId, String name, Timestamp timestamp);

	/**
	 * @return
	 */
	List<Period> getAllPeriod();

	/**
	 * @param materialName
	 * @return
	 */
	boolean queryByMaterialName(String materialName);

	/**
	 * @param mid
	 * @return
	 */
	Material queryById(String mid);

	/**
	 * @param map
	 */
	void updateFile(Material map);

	void saveInsertTable(IPTable insertTable);

	List<IPTable> getAllIPTable(String terminalId);

	Page pageSearchByAreaCode(String areaCode, int currentPage, int pageSize);

	List<Period> getAllMaterialByTid(String string);

	boolean generateTable(String periodId, String uid);

	Page searchMaterialByPid(String string, int currentPage, int pageSize);

	List<User> getAllUser();

	List<IPTable> getAllIPTableNo();

	Terminal getTerminalById(String substring);

	Page pageSearchByTid(String tid, int page, int limit);

	Items queryByItemId(String mid);

	void updateItem(Items file);

	List<Period> getAllItemsPeriod(String string);

	Map<String, Object> generateTb(String periodId, String uid, String startDate, String endDate);

	void resetPtableState(String pid);

	void saveInsetPlayTable(PlayTable ptable, String mid);

	void deleteItems(String[] itemIds);
	
	//7.14
    boolean copyOneToPlayFile(String pid, String mid,int num);
    
    //7.15
    boolean delOneFromPlayFile(String pid, String mid,int num);


    //2020.1.11 by bobo
	User getUserById(String id);

	Role getRoleById(String id);
}  