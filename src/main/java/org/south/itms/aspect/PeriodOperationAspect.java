/* author:bobo
 * time:2019-11-16
 * 完成时段相关操作的切面控制器类实现		
 */
package org.south.itms.aspect;

import javax.servlet.http.HttpSession;
import org.aspectj.lang.JoinPoint;
import org.south.itms.entity.Period;
import org.south.itms.service.impl.PeriodServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

public class PeriodOperationAspect {
	
	//时段操作
	private final String OBJECT_TYPE = "PERIOD";
	
	//注入时段服务
	@Autowired
	private PeriodServiceImpl periodServiceImpl;
	
	//注入切面公共方法
	@Autowired
	private AspectCommonMethod aspectCommonMethod;
	
	
	//时段则增加切面
	public void completePeriodAdd(JoinPoint joinPoint) {
		
		final String  currentOperation = "PERIOD_ADD";	
		System.out.println("completePeriodAdd!");
						
		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();
		
		//异常处理
		if (! (boolean) session.getAttribute("completePeriodAdd")) {
			return;
		}
		//重置
		session.setAttribute("completePeriodAdd", false);
				    	
		//被修改对象的信息填写
		Period period = (Period) session.getAttribute("newPeriod");
		String modifyObjectName = period.getPeriodName();
		String modifyObjectType = OBJECT_TYPE;
		String modifyObjectId =  period.getPeriodId();
		    		
		//生成并保存用户日志
		aspectCommonMethod.saveUserActionLog(
				(String)session.getAttribute("userName"),
				(String)session.getAttribute("roleName"), 
				aspectCommonMethod.getOperationTime(), 
				currentOperation, 
				modifyObjectName, 
				modifyObjectType, 
				modifyObjectId);			
	}
	
	
	//时段删除切面
	public void completePeriodDelete(JoinPoint joinPoint) {
		
		final String  currentOperation = "PERIOD_DELETE";
		System.out.println("CompletePeriodDelete！");
		
		//获取连接点
		Object[] args = joinPoint.getArgs();
		String[] periodIds = (String[])args[0];
				
		//异常处理
		if (periodIds.length == 0){
			return;
		}

		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();
		    
		//异常处理
		if (periodIds.length == 0) return;
	
		//生成所有时段删除的操作日志
		for (int i = 0 ;i < periodIds.length ; i++)
		{
			//获取被删除的时段
			Period period = periodServiceImpl.getPeriod(periodIds[i]);
			
			//获取被修改对象的信息
			String modifyObjectName = period.getPeriodName();
			String modifyObjectType = OBJECT_TYPE;
			String modifyObjectId = periodIds[i];	
			
			//生成并保存用户日志
			aspectCommonMethod.saveUserActionLog(
					(String)session.getAttribute("userName"),
					(String)session.getAttribute("roleName"), 
					aspectCommonMethod.getOperationTime(), 
					currentOperation, 
					modifyObjectName, 
					modifyObjectType, 
					modifyObjectId);	   		
		}
	}
	
	//时段修改切面
	public void completePeriodModify(JoinPoint joinPoint) {
		
		final String  currentOperation = "PERIOD_MODIFY";
		System.out.println("CompletePeriodModify！");
		
		
		//获取连接点,提取信息
		Object[] args = joinPoint.getArgs();
		Period period = (Period) args[0];
				
		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();

		//获取被修改对象的信息
		String modifyObjectName = period.getPeriodName();
		String modifyObjectType = OBJECT_TYPE;
		String modifyObjectId = period.getPeriodId();
		
		//生成并保存用户日志
		aspectCommonMethod.saveUserActionLog(
				(String)session.getAttribute("userName"),
				(String)session.getAttribute("roleName"), 
				aspectCommonMethod.getOperationTime(), 
				currentOperation, 
				modifyObjectName, 
				modifyObjectType, 
				modifyObjectId);	
		
	}	

}
