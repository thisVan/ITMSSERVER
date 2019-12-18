package org.south.itms.dao.impl;


import org.south.itms.entity.UserActionLog;

public interface AspectDao {
	public void saveLog(UserActionLog userActionLog);
}
