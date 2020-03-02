package org.south.itms.dao.impl;

import java.util.List;
import java.util.Map;

import org.south.itms.dto.Page;
import org.south.itms.dto.PlayNumDto;
import org.south.itms.dto.ValueParam;
import org.south.itms.entity.PlayLog;

public interface StatisticDao {

	List<PlayNumDto> findPlayNumDto(String terminalId, String startTime, String endTime);
	
	List<PlayNumDto> findPlayNumDto(String terminalId, String startTime, String endTime, String materialName);

	List<PlayLog> findPlayLog(String terminalId, String startTime, String endTime,String materialNameLike);
	
	Page pageSearchPlayLog(String terminalId, String material_name, String startTime, String endTime, int currentPage, int pageSize);

	
}  