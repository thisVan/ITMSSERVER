package org.south.itms.dao.impl;

import java.sql.Timestamp;
import java.util.List;


import org.south.itms.entity.Items;
import org.south.itms.entity.Marquee;
import org.south.itms.entity.Material;
import org.south.itms.entity.Terminal;

/**
 * @author jan
 * @date 2017年12月17日 下午5:13:30
 * @version V1.0 
 */
public interface MarqueeDao {
	
	void addMarquee(Marquee marquee);
	void updateMarquee(Marquee marquee);
	Marquee getById(String mid);
	void delMarquee(String mid);
	Marquee findByTerminalId(String tid);
	Marquee findByTerminalIdAndPlayDate(String tid);
	boolean checkFileName(String fileName);
	Marquee checkMarquee(String mid);
//	void saveFile(Material material);

	public void updateMarqueeStatus(String mid,String firstUserName,String secondUserName,String statusId);
	
	List<Terminal> getAllTerminal();

	Terminal getTerminalInfo(String terminalId);


//	void checkAccess(String mid, String name, Timestamp timestamp);
//
//	void checkUnAccess(String mid, String name, Timestamp timestamp);

	int getAllRecord(String str);
	//7.16
	List<Marquee> findAllMarquee();
	int delMarquee2(String id);
	List<Marquee> findMarqueeByTerminalIdBetweenDates(String terminalId, String format, String format2);
	void marqueeUnAccess(String mid, String statusId);
}
