package org.south.itms.service.impl;

import java.util.List;

import org.south.itms.dto.Page;
import org.south.itms.dto.PlayNumDto;
import org.south.itms.entity.PlayLog;

public interface StatisticService {

	List<PlayNumDto> findPlayNumDto(String terminalId, String startTime, String endTime);

	List<PlayLog> findPlayLog(String terminalId, String startTime, String endTime);

	Page findPlayLogByPages(String terminalId, String startTime, String endTime, int currentPage, int pageSize);

}
