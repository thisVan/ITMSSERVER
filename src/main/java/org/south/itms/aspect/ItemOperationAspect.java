/* author:bobo
 * time:2019-11-25
 * 完成节目相关操作的切面控制器类实现		
 */
package org.south.itms.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.south.itms.entity.Items;
import org.south.itms.entity.Period;
import org.south.itms.service.impl.CommonServiceImpl;
import org.south.itms.service.impl.MaterialServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

public class ItemOperationAspect {
	
	//节目切面
	private final String OBJECT_TYPE = "ITEM";
	
	//注入切面公共方法
	@Autowired
	private AspectCommonMethod aspectCommonMethod;
	
	//注入公共服务
	@Autowired
	private CommonServiceImpl commonServiceImpl;
	
	
	//节目增加
	public void completeItemAdd(JoinPoint joinPoint) {
		
		final String  currentOperation = "ITEM_ADD";
		System.out.println("CompleteItemAdd！");
		
		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();
				
		//异常处理
		if (! (boolean) session.getAttribute("completeItemAdd") ||session.getAttribute("newItem") == null ) {
			return;
		}
		
		//重置
		session.setAttribute("completeItemAdd", false);
	    	
		//被修改对象的信息填写
		Items item = (Items) session.getAttribute("newItem");
		String modifyObjectName = item.getItemName();
		String modifyObjectType = OBJECT_TYPE;
		String modifyObjectId =  item.getItemId();
				    		
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
	
	public void completeItemDelete(JoinPoint joinPoint) {
		
		final String  currentOperation = "ITEM_DELETE";
		System.out.println("CompleteItemDelete！");

		//获取连接点
		Object[] args = joinPoint.getArgs();
		String[] itemIds = (String[])args[0];
						
		//异常处理
		if (itemIds.length == 0){
			return;
		}

		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();
			
		//生成所有时段删除的操作日志
		for (int i = 0 ;i < itemIds.length ; i++)
		{
			//获取被删除的时段
			Items item = commonServiceImpl.queryByItemId(itemIds[i]);
					
			//获取被修改对象的信息
			String modifyObjectName = item.getItemName();
			String modifyObjectType = OBJECT_TYPE;
			String modifyObjectId = itemIds[i];
					
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
	
	
	//节目修改
	public void completeItemModify(JoinPoint joinPoint) {
		
		final String  currentOperation = "ITEM_MODIFY";
		System.out.println("CompleteItemModify！");
				
		//获取连接点,提取信息
		Object[] args = joinPoint.getArgs();
		String itemId = (String) args[0];
						
		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();

		//获取被修改对象的信息
		//获取被删除的时段
		Items item = commonServiceImpl.queryByItemId(itemId);
		String modifyObjectName =item.getItemName();
		String modifyObjectType = OBJECT_TYPE;
		String modifyObjectId = item.getPeriodId();
				
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
