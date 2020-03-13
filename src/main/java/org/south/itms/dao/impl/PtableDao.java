package org.south.itms.dao.impl;

import java.text.ParseException;
import java.util.List;

import org.south.itms.entity.IPTable;
import org.south.itms.entity.Material;
import org.south.itms.entity.PlayTable;

public interface PtableDao {

	PlayTable load(String id);

	int countByName(PlayTable entity);

	String save(PlayTable entity);

	void delete(String id);

	void savePtableFileRelation(String pid, String[] fileIds);

	void delPtableFileRelation(String pid);

	List<PlayTable> findAllPlayTable();

	PlayTable get(String id);

	void modifyPlayTableNum(String pid, String sortNum);

	void updateTableStatus(String pid) throws ParseException;
	
	void updateTableStatusFinal(String pid) throws ParseException;

	void saveInsertTable(IPTable insertTable);

	void saveTable(IPTable insert);

	void updateTableStatusFinalUn(String pid, String mark) throws ParseException;

	void playTableUnAccess(String pid, String statusId) throws ParseException;
	
	void updateAllTime(String pid, String allTime, String screenRate);

	List<PlayTable> getTableById(String statusId);

	PlayTable getById(String pid);

	void resetPtableState(String pid);

	List<PlayTable> getTableByTwoId(String statusId1, String statusId2);
	
	//7.15
	void modifyPlayTableNumbyDelAll(String ppid, String sortNum);
	
	//2018.11.27
	List<PlayTable> findPlayTable(String terminalId, String startTime, String endTime, String statusId);
	
	List<PlayTable> findByTerminalId(String terminalId);
	
	List<PlayTable> findInsertByTerminalId(String terminalId);
	
	List<Material> findAllMaterialByPlayTableId(String pid);
	
	List<Material> findAllMaterialByPlayTableIdAndType(String pid,String file_type);


    void updateUnAccessReason(String pid, String reason);
}
