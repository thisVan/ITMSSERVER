package org.south.itms.service.impl;

import org.south.itms.dao.impl.AspectDaoImpl;
import org.south.itms.entity.UserActionLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("aspectService")
public class AspectServiceImpl implements AspectService {

	@Autowired
	private AspectDaoImpl aspectDaoImpl;
	
	//保存稿件操作的日志
	@Transactional
	@Override
	public void saveLog(UserActionLog userActionLog) {
		// TODO Auto-generated method stub
		aspectDaoImpl.saveLog(userActionLog);
	}

}
