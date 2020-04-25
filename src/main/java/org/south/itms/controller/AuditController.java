/* author : bobo
 * time   : 2019-11-18
 * 完成审计的控制器
 */
package org.south.itms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.south.itms.dto.Page;
import org.south.itms.dto.PageResultData;
import org.south.itms.entity.UserActionLog;
import org.south.itms.service.impl.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/audit")
public class AuditController {
	
	@Autowired
	private CommonService commonService;
	
	
	//稿件审计
	@RequestMapping("/materialAudit")
	public String materialAudit(Model model, HttpServletRequest request) {
		return "audit/materialAudit";
	}

	
	
	@RequestMapping("/getAllMaterialAuditLog")
	@ResponseBody
	public PageResultData<UserActionLog> getAllMaterialAuditLog(String start, String end,String param, int page, 
			int limit, Model model, HttpServletRequest request) {

		String[] params = param.split(",");
		try {
			Page pageD = commonService.pageSearchUserActionLogByTemplateHQL(start,end,params, page, limit, "UserActionLog", "operationTime desc", null);
			List<UserActionLog> logList = pageD.getList();
			PageResultData<UserActionLog> pageResult = new PageResultData<UserActionLog>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(logList);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<UserActionLog> pageResult1 = new PageResultData<UserActionLog>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setMsg("查询异常");
			pageResult1.setFail(1);
			return pageResult1;
		}
	}

	@RequestMapping("/itemAudit")
	public String itemAudit(Model model, HttpServletRequest request) {
		return "audit/itemAudit";
	}

	
	
	@RequestMapping("/getAllItemAuditLog")
	@ResponseBody
	public PageResultData<UserActionLog> getAllItemAuditLog(String start, String end,String param, int page, 
			int limit, Model model, HttpServletRequest request) {

		String[] params = param.split(",");
		try {
			Page pageD = commonService.pageSearchUserActionLogByTemplateHQL(start,end,params, page, limit, "UserActionLog", "operationTime desc", null);
			List<UserActionLog> logList = pageD.getList();
			PageResultData<UserActionLog> pageResult = new PageResultData<UserActionLog>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(logList);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<UserActionLog> pageResult1 = new PageResultData<UserActionLog>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setMsg("查询异常");
			pageResult1.setFail(1);
			return pageResult1;
		}
	}


	@RequestMapping("/periodAudit")
	public String periodAudit(Model model, HttpServletRequest request) {
		return "audit/periodAudit";
	}



	@RequestMapping("/getAllPeriodAuditLog")
	@ResponseBody
	public PageResultData<UserActionLog> getAllPeriodAuditLog(String start, String end,String param, int page,
															  int limit, Model model, HttpServletRequest request) {
		String[] params = param.split(",");
		try {
			Page pageD = commonService.pageSearchUserActionLogByTemplateHQL(start,end,params, page, limit, "UserActionLog", "operationTime desc", null);
			List<UserActionLog> logList = pageD.getList();
			PageResultData<UserActionLog> pageResult = new PageResultData<UserActionLog>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(logList);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<UserActionLog> pageResult1 = new PageResultData<UserActionLog>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setMsg("查询异常");
			pageResult1.setFail(1);
			return pageResult1;
		}
	}



	@RequestMapping("/ptableAudit")
	public String ptableAudit(Model model, HttpServletRequest request) {
		return "audit/ptableAudit";
	}



	@RequestMapping("/getAllPtableAuditLog")
	@ResponseBody
	public PageResultData<UserActionLog> getAllPtableAuditLog(String start, String end,String param, int page,
															  int limit, Model model, HttpServletRequest request) {
		String[] params = param.split(",");
		try {
			Page pageD = commonService.pageSearchUserActionLogByTemplateHQL(start,end,params, page, limit, "UserActionLog", "operationTime desc", null);
			List<UserActionLog> logList = pageD.getList();
			PageResultData<UserActionLog> pageResult = new PageResultData<UserActionLog>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(logList);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<UserActionLog> pageResult1 = new PageResultData<UserActionLog>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setMsg("查询异常");
			pageResult1.setFail(1);
			return pageResult1;
		}
	}


	@RequestMapping("/systemAudit")
	public String systemAudit(Model model, HttpServletRequest request) {
		return "audit/systemAudit";
	}



	@RequestMapping("/getAllSystemAuditLog")
	@ResponseBody
	public PageResultData<UserActionLog> getAllSystemAuditLog(String start, String end,String param, int page,
															  int limit, Model model, HttpServletRequest request) {
		String[] params = param.split(",");
		try {
			Page pageD = commonService.pageSearchUserActionLogByTemplateHQL(start,end,params, page, limit, "UserActionLog", "operationTime desc", null);
			List<UserActionLog> logList = pageD.getList();
			PageResultData<UserActionLog> pageResult = new PageResultData<UserActionLog>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(logList);

			System.out.println("查到的logList:");
			System.out.println(pageResult);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<UserActionLog> pageResult1 = new PageResultData<UserActionLog>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setMsg("查询异常");
			pageResult1.setFail(1);
			return pageResult1;
		}
	}




}
