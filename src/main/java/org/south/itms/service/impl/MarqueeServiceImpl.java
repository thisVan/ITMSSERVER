package org.south.itms.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.south.itms.dao.impl.MarqueeDao;
import org.south.itms.dao.impl.MaterialDao;
import org.south.itms.dto.TreeDate;
import org.south.itms.entity.Items;
import org.south.itms.entity.Marquee;
import org.south.itms.entity.Material;
import org.south.itms.entity.Terminal;
import org.south.itms.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author jan
 * @date 2017年12月16日 下午11:58:53
 * @version V1.0 
 */
@Service("marqueeService")
public class MarqueeServiceImpl implements MarqueeService {

	@Autowired
	private MarqueeDao marqueeDao;

	@Override
	public void addMarquee(Marquee marquee) {
		// TODO Auto-generated method stub
		marqueeDao.addMarquee(marquee);
		
	}

	@Override
	public void updateMarquee(Marquee marquee) {
		// TODO Auto-generated method stub
		marqueeDao.updateMarquee(marquee);
		
	}

	@Override
	public Marquee getById(String mid) {
		// TODO Auto-generated method stub
		return marqueeDao.getById(mid);
	}

	@Override
	public void delMarquee(String mid) {
		// TODO Auto-generated method stub
		marqueeDao.delMarquee(mid);
	}

	@Override
	public Marquee findByTerminalId(String tid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Marquee findByTerminalIdAndPlayDate(String tid) {
		// TODO Auto-generated method stub
		return marqueeDao.findByTerminalIdAndPlayDate(tid);
	}

	@Override
	public boolean checkFileName(String fileName) {
		// TODO Auto-generated method stub
		return marqueeDao.checkFileName(fileName);
	}

	@Override
	public Marquee checkMarquee(String mid) {
		// TODO Auto-generated method stub
		return marqueeDao.checkMarquee(mid);
	}

	@Override
	public List<Terminal> getAllTerminal() {
		// TODO Auto-generated method stub
		return marqueeDao.getAllTerminal();
	}

	@Override
	public Terminal getTerminalInfo(String terminalId) {
		// TODO Auto-generated method stub
		return marqueeDao.getTerminalInfo(terminalId);
	}

	@Override
	public int getAllRecord(String str) {
		// TODO Auto-generated method stub
		return marqueeDao.getAllRecord(str);
	}

	@Override
	public List<Marquee> findAllMarquee() {
		// TODO Auto-generated method stub
		return marqueeDao.findAllMarquee();
	}

	@Override
	public int delMarquee2(String id) {
		// TODO Auto-generated method stub
		return marqueeDao.delMarquee2(id);
	}

	@Override
	public List<Marquee> findMarqueeByTerminalIdBetweenDates(String terminalId, String format, String format2) {
		// TODO Auto-generated method stub
		return marqueeDao.findMarqueeByTerminalIdBetweenDates(terminalId,format,format2);
	}

	@Override
	public void updateMarqueeStatus(String mid,String firstUserName,String secondUserName,String statusId) {
		marqueeDao.updateMarqueeStatus(mid,firstUserName,secondUserName,statusId);
		
	}

	@Override
	public void marqueeUnAccess(String mid, String statusId) {
		marqueeDao.marqueeUnAccess(mid,statusId);
	}
	
	

}
