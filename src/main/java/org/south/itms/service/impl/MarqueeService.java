package org.south.itms.service.impl;


import java.util.List;

import org.hibernate.query.Query;
import org.south.itms.entity.Marquee;
import org.south.itms.entity.PlayTable;
import org.south.itms.entity.Terminal;
public interface MarqueeService {
	void addMarquee(Marquee marquee);
	void updateMarquee(Marquee marquee);
	Marquee getById(String mid);
	void delMarquee(String mid);
	Marquee findByTerminalId(String tid);
	Marquee findByTerminalIdAndPlayDate(String tid);
	boolean checkFileName(String fileName);
	Marquee checkMarquee(String mid);
	List<Terminal> getAllTerminal();
	Terminal getTerminalInfo(String terminalId);
	int getAllRecord(String str);
	List<Marquee> findAllMarquee();
	public void updateMarqueeStatus(String mid,String firstUserName,String secondUserName,String statusId);
	int delMarquee2(String id);
	
	public void marqueeUnAccess(String mid, String statusId);
	
	List<Marquee> findMarqueeByTerminalIdBetweenDates(String terminalId, String format, String format2);
}
