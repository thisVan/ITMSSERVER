package org.south.itms.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.south.itms.dao.impl.PtableDao;
import org.south.itms.dto.Result;
import org.south.itms.entity.IPTable;
import org.south.itms.entity.Material;
import org.south.itms.entity.PlayTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author: yezilong
 */

@Service("ptableService")  
public class PtableServiceImpl implements PtableService {

	@Autowired
	private PtableDao ptableDao;
	
	@Transactional
	@Override
	public void buildPtableFileRelation(String pid, String[] fileIds) {
		  //先将原先的播放表和视频文件关系删除
		  ptableDao.delPtableFileRelation(pid);
		  
		  //再添加播放表和视频文件的关联
		  if(fileIds != null) ptableDao.savePtableFileRelation(pid, fileIds);
	}	
	
	@Override  
    public int countByName(PlayTable entity) {
		return ptableDao.countByName(entity);
	}

	@Transactional
	@Override
	public void deletePtable(String[] ids) {
		for(String id : ids) {
			ptableDao.delete(id);
		}
	}

	@Override
	public void modifyPlayTableNum(String pid, String sortNum) {
		ptableDao.modifyPlayTableNum(pid, sortNum);
	}

	@Override
	public void updateTableStatusFinal(String pid) throws ParseException {
		ptableDao.updateTableStatusFinal(pid);
	}

	@Override
	public void updateTableStatus(String pid) throws ParseException {
		ptableDao.updateTableStatus(pid);
	}

	@Override
	public void saveInsertTable(IPTable insert) {
		ptableDao.saveInsertTable(insert);
	}

	@Override
	public void updateTableStatus(String pid, String statusId) {
		
	}

	@Override
	public void updateTableStatusFinalUn(String pid, String mark) throws ParseException {
		ptableDao.updateTableStatusFinalUn(pid, mark);
	}

	@Override
	public void playTableUnAccess(String pid, String statusId) throws ParseException {
		ptableDao.playTableUnAccess(pid, statusId);
	}
	
	@Override
	public void updatePlayTableAllTime(String pid, String allTime, String screenRate) {
		ptableDao.updateAllTime(pid, allTime, screenRate);
	}

	@Override
	public List<PlayTable> getTableById(String statusId) {
		return ptableDao.getTableById(statusId);
	}  
	
	@Override
	public List<PlayTable> getTableByTwoId(String statusId1, String statusId2) {
		return ptableDao.getTableByTwoId(statusId1, statusId2);
	}

	//7.15
	@Override
	public void modifyPlayTableNumbyDelAll(String ppid, String sortNum) {
		ptableDao.modifyPlayTableNumbyDelAll(ppid, sortNum);
	}  
	
	public PlayTable getPlayTableByPid(String pid) {
		return ptableDao.getById(pid);
	}
	
	@Override
	public List<PlayTable> findPlayTable(String terminalId, String startTime, String endTime, String statusId){
		return ptableDao.findPlayTable(terminalId, startTime, endTime, statusId);
	}
	
	@Override
	public List<PlayTable> findPlayTablesByTerminalId(String terminalId){
		return ptableDao.findByTerminalId(terminalId);
	}
	
	@Override
	public List<PlayTable> findInsertPlayTablesByTerminalId(String terminalId){
		return ptableDao.findInsertByTerminalId(terminalId);
	}
	
	@Override
	public List<Material> findAllMaterialsByPlayTableId(String pid){
		return ptableDao.findAllMaterialByPlayTableId(pid);
	}

	@Override
	public List<Material> findAllMaterialsByPlayTableIdAndFiletype(String pid, String fileType) {
		return ptableDao.findAllMaterialByPlayTableIdAndType(pid, fileType);
	}

	@Override
	public void updateUnAccessReason(String pid, String reason) {
		ptableDao.updateUnAccessReason(pid,reason);
	}

	@Override
	public List<PlayTable>  getPtableGroupAndMembers(String pid,int checkKind) {
		return ptableDao.getPtableGroupAndMembers(pid,checkKind);
	}

	@Override
	public void saveInsertPlayTableGroup(List<String> pids) {
		ptableDao.saveInsertPlayTableGroup(pids);
	}


}
