package org.south.itms.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.south.itms.dao.impl.StatisticDao;
import org.south.itms.dto.Page;
import org.south.itms.dto.PlayNumDto;
import org.south.itms.entity.PlayLog;
import org.south.itms.util.OracleDBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: yezilong
 */

@Service("statisticService")
public class StatisticServiceImpl implements StatisticService {

	@Autowired
	private StatisticDao statisticDao;

	@Override
	public List<PlayNumDto> findPlayNumDto(String terminalId, String startTime, String endTime) {
		// TODO Auto-generated method stub
		return statisticDao.findPlayNumDto(terminalId, startTime, endTime);
	}
	
	@Override
	public List<PlayNumDto> findPlayNumDto(String terminalId, String startTime, String endTime, String materialName) {
		// TODO Auto-generated method stub
		return statisticDao.findPlayNumDto(terminalId, startTime, endTime, materialName);
	}

	@Override
	public List<PlayLog> findPlayLog(String terminalId, String startTime, String endTime) {
		// TODO Auto-generated method stub
		return statisticDao.findPlayLog(terminalId, startTime, endTime);
	}

	@Override
	public Page findPlayLogByPages(String terminalId, String material_name, String startTime, String endTime, int currentPage, int pageSize) {
		return statisticDao.pageSearchPlayLog(terminalId, material_name, startTime, endTime, currentPage, pageSize);
	}

	@Override
	public Page findPlayLogFromGXLEDByPages(String terminalId, String material_name, String startTime, String endTime, int page, int limit) {
		Connection connection = OracleDBUtil.getConnection();
		material_name = material_name.replaceAll(" ", "%");
		material_name = "%" + material_name + "%";
		int startIndex = (page - 1) * limit;
		int endIndex = page * limit;
		String sql = "SELECT * FROM (SELECT PLAYLOG.MEDIANAME,PLAYLOG.STARTTIME,PLAYLOG.ENDTIME FROM PLAYLOG WHERE PLAYLOG.ENDTIME <=TO_DATE('" + endTime
				+ "', 'yyyy-mm-dd hh24:mi:ss') AND PLAYLOG.STARTTIME >= TO_DATE('" + startTime + "', 'yyyy-mm-dd hh24:mi:ss') AND PLAYLOG.MEDIANAME LIKE '"
				+ material_name + "' ORDER BY PLAYLOG.ENDTIME DESC) WHERE ROWNUM <= " + endIndex + " AND ROWNUM > " + startIndex;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("stu_name");
				String gender = rs.getString("gender");
				String age = rs.getString("age");
				String address = rs.getString("address");
				System.out.println(id + "\t" + name + "\t" + gender + "\t" + age + "\t" + address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleDBUtil.releaseResource();
		}

		return null;
	}

}
