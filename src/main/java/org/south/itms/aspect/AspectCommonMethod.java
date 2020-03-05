package org.south.itms.aspect;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.south.itms.entity.UserActionLog;
import org.south.itms.service.impl.AspectServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

//这个类是一个切面业务的公共方法类，注册为bean，本类做了抽象，将常用的代码拿出来，供之后的切面业务调用
@Service("aspectCommonMethod")
public class AspectCommonMethod {
	
	//注入调用的稿件切面服务
	@Autowired
	private AspectServiceImpl aspectServiceImpl;
	
	//获取当前时间
	public String getOperationTime() {
		Date nowDate = new Date();   
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(nowDate);  
	}
	
	//获取session
	public HttpSession getNowSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpSession session=attr.getRequest().getSession(true);
		return session;
	}
	
	//保存用户日志
	public void saveUserActionLog(String userName,String roleName,String operationTime,
			String currentOperation,String modifyObjectName,String modifyObjectType, String modifyObjectId) {
		
		UserActionLog userActionLog = new UserActionLog(
				userName,
				roleName,
				operationTime,
				currentOperation,
				modifyObjectName,
				modifyObjectType,
				modifyObjectId);
		    	
		//使用稿件切面Service
		aspectServiceImpl.saveLog(userActionLog);   	
		System.out.println(userActionLog.toString());			
	}
}
