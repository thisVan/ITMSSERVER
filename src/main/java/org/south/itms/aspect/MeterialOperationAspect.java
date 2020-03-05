/* author:bobo
 * time:2019-11-4
 * 完成稿件相关操作的切面控制器类实现
 */
package org.south.itms.aspect;

import javax.servlet.http.HttpSession;
import org.aspectj.lang.JoinPoint;
import org.south.itms.entity.Material;
import org.south.itms.service.impl.MaterialServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class MeterialOperationAspect {
	
	//稿件操作，被操作对象都是稿件
	private final String OBJECT_TYPE = "MATERIAL";
	
	
	//注入稿件服务
	@Autowired
	private MaterialServiceImpl materialServiceImpl;
	
	//注入切面公共方法
	@Autowired
	private AspectCommonMethod aspectCommonMethod;
	
	//注入
	
	//稿件上传切面
	public void completeMaterialUpload(JoinPoint joinPoint) {
		
		final String  currentOperation = "MATERIAL_UPLOAD";
		System.out.println("CompleteMaterialUpload！");
		
		//获取连接点，提取信息
		Object[] args = joinPoint.getArgs();
		CommonsMultipartFile file = (CommonsMultipartFile) args[0];
		String fileName = file.getOriginalFilename();
				
		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();
		    	
		//被修改对象的信息填写
		String modifyObjectName = fileName;
		String modifyObjectType = OBJECT_TYPE;
		String modifyObjectId =  (String) session.getAttribute("materialAutoAddId");
		
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
	
	//稿件删除切面
	public void completeMaterialDelete(JoinPoint joinPoint) {
		
		final String  currentOperation = "MATERIAL_DELETE";
		System.out.println("CompleteMaterialDelete！");
		
		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();
		
		//获取要删除稿件的ID
		Object[] args = joinPoint.getArgs();
		String[] materialIds = (String[])args[0];
		
		//异常处理
		if (materialIds.length == 0) return;
	
		
		//生成所有稿件删除的操作日志
		for (int i = 0 ;i < materialIds.length ; i++)
		{
			//获取被删除的稿件
			Material material = materialServiceImpl.getById(materialIds[i]);
			
			//获取被修改对象的信息
			String modifyObjectName = material.getMaterialName();
			String modifyObjectType = OBJECT_TYPE;
			String modifyObjectId = materialIds[i];	
			
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
	
	//稿件修改切面
	public void completeMaterialModify(JoinPoint joinPoint) {
		
		final String  currentOperation = "MATERIAL_MODIFY";
		System.out.println("CompleteMaterialModify！");
		
		//获取连接点，提取信息
		Object[] args = joinPoint.getArgs();
		String fileName = (String) args[1];
				
		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();

		//获取被修改对象的信息
		String modifyObjectName = fileName;
		String modifyObjectType = OBJECT_TYPE;
		String modifyObjectId = (String) args[0];
		
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
	
	//稿件审核切面
	public void completeMaterialReview(JoinPoint joinPoint ) {
		
		final String  currentOperation = "MATERIAL_REVIEW";
		System.out.println("CompleteMaterialReview！");	

		//获取session
		HttpSession session = aspectCommonMethod.getNowSession();
		
		//获取连接点，提取信息
		Object[] args = joinPoint.getArgs();
		Material material =materialServiceImpl.getById( (String)args[0] );
		    	
		//获取被修改对象的信息
		String modifyObjectName = material.getMaterialName();
		String modifyObjectType = OBJECT_TYPE;
		String modifyObjectId = (String)args[0];
		    	
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