package org.south.itms.dao.impl;

import java.util.List;
import java.util.Map;

import org.south.itms.dto.Page;
import org.south.itms.dto.PlayNumDto;
import org.south.itms.dto.ValueParam;
import org.south.itms.entity.PlayLog;

public interface StatisticDao {

	List<PlayNumDto> findPlayNumDto(String terminalId, String startTime, String endTime);

	List<PlayLog> findPlayLog(String terminalId, String startTime, String endTime);
	
	Page pageSearchPlayLog(String terminalId, String startTime, String endTime, int currentPage, int pageSize);

	
}  