package org.south.itms.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.south.itms.entity.IPTable;
import org.south.itms.entity.Material;
import org.south.itms.entity.PlayTable;

public interface PtableService {


	void buildPtableFileRelation(String pid, String[] fileIds);

	int countByName(PlayTable entity);

	void deletePtable(String[] ids);

	void modifyPlayTableNum(String pid, String sortNum);

	void updateTableStatusFinal(String pid) throws ParseException;

	void updateTableStatus(String pid) throws ParseException;

	void saveInsertTable(IPTable insert);

	void updateTableStatus(String pid, String statusId);

	void updateTableStatusFinalUn(String pid, String mark) throws ParseException;

	void playTableUnAccess(String pid, String string) throws ParseException;
	
	/**
	 * 更新播表的播放时长和占屏率
	 * @param pid
	 * @param allTime
	 * @param screenRate
	 */
	void updatePlayTableAllTime(String pid, String allTime, String screenRate);

	List<PlayTable> getTableById(String string);

	List<PlayTable> getTableByTwoId(String statusId1, String statusId2);
	
	//7.15
	void modifyPlayTableNumbyDelAll(String ppid, String sortNum);
	
	/**
	 * 根据pid取出播表
	 * @since 2018年11月28日 17点45分
	 * @author PC-FAN
	 * @param pid
	 * @return
	 */
	PlayTable getPlayTableByPid(String pid);
	
	//2018.11.27
	List<PlayTable> findPlayTable(String terminalId, String startTime, String endTime, String statusId);
	
	List<PlayTable> findPlayTablesByTerminalId(String terminalId);

	List<PlayTable> findInsertPlayTablesByTerminalId(String terminalId);
	
	List<Material> findAllMaterialsByPlayTableId(String pid);
	List<Material> findAllMaterialsByPlayTableIdAndFiletype(String pid,String fileType);

    void updateUnAccessReason(String pid, String reason);

	List<PlayTable>  getPtableGroupAndMembers(String pid,int checkKind);
	void saveInsertPlayTableGroup(List<String> pids);
}