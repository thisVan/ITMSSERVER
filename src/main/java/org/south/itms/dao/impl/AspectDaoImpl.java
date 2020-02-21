package org.south.itms.dao.impl;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.south.itms.entity.UserActionLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AspectDaoImpl implements AspectDao {

	@Autowired  
    private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {  
        return this.sessionFactory.getCurrentSession();  
    }
	private Session openSession() {  
        return this.sessionFactory.openSession();  
    } 
	
	@Override
	public void saveLog(UserActionLog userActionLog) {
		// TODO Auto-generated method stub
		System.out.printf("begin save log");
		this.getCurrentSession().save(userActionLog);
		System.out.printf("end save log");
		
	}

}
