package org.south.itms.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.sql.*;
import java.text.Collator;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.south.itms.dao.impl.*;
import org.south.itms.dto.MarqueeDto;
import org.south.itms.dto.MaterialDto;
import org.south.itms.dto.Page;
import org.south.itms.dto.PageResultData;
import org.south.itms.dto.PtableDto;
import org.south.itms.dto.Result;
//import org.south.itms.entity.File;
import org.south.itms.entity.IPTable;
import org.south.itms.entity.Items;
import org.south.itms.entity.Marquee;
import org.south.itms.entity.Material;
import org.south.itms.entity.Period;
import org.south.itms.entity.PlayTable;
import org.south.itms.entity.Terminal;
import org.south.itms.entity.User;
import org.south.itms.service.impl.*;
import org.south.itms.util.Constant;
import org.south.itms.util.EntityUtil;
import org.south.itms.util.SqlUtil;
import org.south.itms.util.StringUtil;
import org.south.itms.util.TimeUtil;
import org.south.netty.NettyChannelMap;
import org.south.netty.PlayTableTask;
import org.south.netty.TableAutoGenerate;
import org.south.netty.msg.DataKey;
import org.south.netty.msg.FileDto;
import org.south.netty.msg.FileInfoDto;
import org.south.netty.msg.InsertDto;
import org.south.netty.msg.MarqueeInfoDto;
import org.south.netty.msg.MsgType;
import org.south.netty.msg.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import io.netty.channel.ChannelFuture;

/**
 * @author: yezilong
 */

@Controller
@RequestMapping("/ptable")
public class PtableController {

	@Autowired
	private CommonService commonService;

	@Autowired
	private TerminalService terminalService;

	@Autowired
	private PtableService ptableService;

	@Autowired
	private AcctUserService userService;

	@Autowired
	private PtableDao ptableDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private FileDao fileDao;

	@Autowired
	private MaterialDao materialDao;
	
	@Autowired
	private MaterialService materialService;
	
	@Autowired
	private MarqueeService marqueeService;
	
	//配置Log4j日志记录
	private static Logger logger = Logger.getLogger(PtableController.class);

	@RequestMapping("/ptableList")
	public String ptableList(Model model, HttpServletRequest request) {
		/*List<Terminal> listTerminal = commonService.getAllTerminal();
		model.addAttribute("terminalPtable", listTerminal);
		// request.getSession().setAttribute("terminalPtable", listTerminal);
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		return "ptable/ptableList";*/

		// zhenghe
		List<Terminal> listTerminal = commonService.getAllTerminal();
		model.addAttribute("terminalPtable", listTerminal);
		// request.getSession().setAttribute("terminalPtable", listTerminal);
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		if ((Constant.adminValue).equals((String) request.getSession().getAttribute("rId"))
				|| (Constant.broadValue).equals((String) request.getSession().getAttribute("rId"))) {
			return "ptable/ptableList";
		}

		return "ptable/ptableListOther";
	}
	
	//12.30
	@RequestMapping("/insertPtableList")
	public String insertPtableList(Model model, HttpServletRequest request) {
		List<Terminal> listTerminal = commonService.getAllTerminal();
		model.addAttribute("terminalPtable", listTerminal);
		//request.getSession().setAttribute("terminalPtable", listTerminal);
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		if((Constant.adminValue).equals((String)request.getSession().getAttribute("rId"))||
				(Constant.broadValue).equals((String)request.getSession().getAttribute("rId"))) {
			return "ptable/insertPtable";
		}
		return "ptable/insertPtable";
	}

	@RequestMapping("/insteadPtable")
	public String insteadPtable(Model model, HttpServletRequest request) {
		List<Terminal> listTerminal = commonService.getAllTerminal();
		model.addAttribute("terminalPtable", listTerminal);
		return "instead/insteadPtableList";
	}
	
	@RequestMapping("/insteadMarquee")
	public String insteadMarquee(Model model, HttpServletRequest request) {
		List<Terminal> listTerminal = commonService.getAllTerminal();
		model.addAttribute("terminalPtable", listTerminal);
		return "instead/insteadMarqueeList";
	}

	/*	@RequestMapping("/addInsertMaterial")
		@ResponseBody
		public String addInsertMaterial(String mid, String terminalId, String intervalTime, String dateTime,
				String testDate, String stat, HttpServletRequest request) throws ParseException {
	
			// commonService.resetPtableState(pid);
	
			String[] time = testDate.split("-");
			java.sql.Time startTime = TimeUtil.translateTime(time[0].trim());
			java.sql.Time endTime = TimeUtil.translateTime(time[1].trim());
			if (TimeUtil.timeValidate(startTime, endTime)) {
				savePtable(terminalId, dateTime, startTime, endTime, stat, mid, request, intervalTime);
			} else {
				return "1";
			}
			return "true";
		}*/

	@RequestMapping("/addInsertMaterial")
	@ResponseBody
	public String addInsertMaterial(String ptableName, String mid, String terminalId, String intervalTime, String dateTime,
			String testDate, String stat, HttpServletRequest request) throws ParseException {

		// commonService.resetPtableState(pid);
		String startDate = "";
		String endDate = "";
		String[] date = dateTime.split(" ");
		startDate = date[0];
		endDate = date[2];
		Date d1 = TimeUtil.translateDate(startDate);
		Date d2 = TimeUtil.translateDate(endDate);
		String[] time = testDate.split("-");
		java.sql.Time startTime = TimeUtil.translateTime(time[0].trim());
		java.sql.Time endTime = TimeUtil.translateTime(time[1].trim());

		int start = 0;// 插播开始时间距离生成插播的时间间隔
		int end = 0;// 插播结束时间距离生成插播的时间间隔
		start = fromListItems(startDate);
		end = fromListItems(endDate);
		if (end < 0)
			return "1";
		if (start < 0)
			start = 0;// 如果开始日期比当前日期时间小
		if (TimeUtil.timeValidate(startTime, endTime) && TimeUtil.dateValidate(d1, d2)) {
			for (int i = start; i <= end; i++) {
				java.util.Calendar cal = java.util.Calendar.getInstance();
				cal.setTime(new Date());
				cal.add(Calendar.DATE, i);
				Date nextDate = cal.getTime();
				java.sql.Date sqlDate = new java.sql.Date(nextDate.getTime());
				savePtable(ptableName, terminalId, sqlDate, startTime, endTime, stat, mid, request, intervalTime);
			}

			// modify by bobo 2020/3/24
			// 这里使用静态变量insertPlayTableAutoIdList，建立播表组
			foundInsertPtableGroup();


		} else {
			return "1";
		}
		return "true";
	}


	// 组成插播播表组
	public void foundInsertPtableGroup() {
		System.out.println("插播已经插入完毕，准备构建组关系,成组的ID为:");
		System.out.println(TableAutoGenerate.insertPlayTableAutoIdList);
		ptableService.saveInsertPlayTableGroup(TableAutoGenerate.insertPlayTableAutoIdList);
	}


	private void savePtable(String ptableName, String terminalId, Date dateTime, Time startTime, Time endTime, String stat, String mid,
			HttpServletRequest request, String intervalTime) throws ParseException {
		Terminal terminal = commonService.getTerminalById(terminalId);
		// Date d = TimeUtil.translateDate(dateTime);
		Date d = dateTime;
		PlayTable ptable = new PlayTable();
		ptable.setCreateTime(new Timestamp(new Date().getTime()));
		String userId = (String) request.getSession().getAttribute("userId");
		ptable.setUserId(userId);
		ptable.setStartTime(startTime);
		ptable.setEndTime(endTime);
		ptable.setPlayDate(d);
		ptable.setDeleted(0);
		ptable.setInsertFlag(1);
		ptable.setState(Integer.parseInt(stat));
		ptable.setTerminalId(terminalId);
		ptable.setStatusId(Constant.uncheck);
		if ("".equals(ptableName)) {
			ptable.setPtableName(terminal.getTerminalName() + " 插播  (" + dateTime + ")");
		} else {
			ptable.setPtableName(ptableName);
		}
		ptable.setMin(Integer.parseInt(intervalTime));
		commonService.saveInsetPlayTable(ptable, mid);
	}

	@RequestMapping("/resetPLayTableState")
	@ResponseBody
	public String resetPtableState(String pid, HttpServletRequest request) {
		System.out.println("pid=" + pid);
		commonService.resetPtableState(pid);
		return "true";
	}
	@RequestMapping("/resetMarqueeState")
	@ResponseBody
	public String resetMarqueeState(String mid, HttpServletRequest request) {
		System.out.println("pid=" + mid);
		//commonService.resetPtableState(mid);
		marqueeService.updateMarqueeStatus(mid, "", "", "1");
		return "true";
	}

	/*@RequestMapping("/ptableCheckFirstList")
	public String ptableCheckFirstList(Model model, HttpServletRequest request) {
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		if ((Constant.adminValue).equals((String) request.getSession().getAttribute("rId"))) {
			return "ptable/ptableCheckFinalListAdmin";
		}
		return "ptable/ptableCheckList";
	}
	
	@RequestMapping("/ptableCheckSecondList")
	public String ptableCheckSecondList(Model model, HttpServletRequest request) {
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		if ((Constant.adminValue).equals((String) request.getSession().getAttribute("rId"))) {
			return "ptable/ptableCheckFinalListAdmin";
		}
		return "ptable/ptableCheckFinalList";
	}*/

	@RequestMapping("/ptableCheckFirstList")
	public String ptableCheckFirstList(Model model, HttpServletRequest request) {
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		if ((Constant.adminValue).equals((String) request.getSession().getAttribute("rId"))) {
			return "ptable/ptableCheckFinalListAdmin";
		}
		return "ptable/ptableCheckList";
	}
	
	@RequestMapping("/MqrqueeCheckFirstList")
	public String MarqueeCheckFirstList(Model model, HttpServletRequest request) {
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		return "ptable/marqueeCheckList";
	}
	@RequestMapping("/MarqueeCheckSecondList")
	public String marqueeCheckSecondList(Model model, HttpServletRequest request) {
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		/* if((Constant.adminValue).equals((String)request.getSession().getAttribute("rId"))) {
			return "ptable/ptableCheckFinalListAdmin";
		}*/
		return "ptable/marqueeCheckFinalList";
	}

	@RequestMapping("/ptableCheckSecondList")
	public String ptableCheckSecondList(Model model, HttpServletRequest request) {
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = userService.getAllUser();
		request.getSession().setAttribute("periodList", listPeriod);
		model.addAttribute("periodL", listPeriod);
		model.addAttribute("userL", listUser);
		/* if((Constant.adminValue).equals((String)request.getSession().getAttribute("rId"))) {
			return "ptable/ptableCheckFinalListAdmin";
		}*/
		return "ptable/ptableCheckFinalList";
	}

	@RequestMapping("/goAddPtable")
	public String goAddPtable(Model model, HttpServletRequest request) {
		List<Terminal> listTerminal = commonService.getAllTerminal();
		model.addAttribute("terminals", listTerminal);
		List<IPTable> listInsert = commonService .getAllIPTable(listTerminal.size() == 0 ? "" : listTerminal.get(0).getTerminalId());
		model.addAttribute("insertTables", listInsert);
		request.getSession().setAttribute("tableNum", listInsert.size());
		// return "ptable/insertPtableOld";
		return "ptable/insertPtable";
	}

	@RequestMapping("/generatePtable")
	public String generatePtable(Model model, HttpServletRequest request) {
		// List<Period> list = commonService.getAllMaterialByTid("9");
		List<Period> list = commonService.getAllItemsPeriod("9");
		request.getSession().setAttribute("periodTwice", list);
		return "ptable/generatePtable";
	}

	@RequestMapping("/generatePtableExcep")
	public String generatePtableExcep(Model model, HttpServletRequest request) {
		List<Period> list = commonService.getAllMaterialByTid("9");
		request.getSession().setAttribute("periodTwice", list);
		return "ptable/generatePtableExcep";
	}

	@RequestMapping("/generateTable")
	public void generateTable(Model model, HttpServletRequest request, String periodId, String startDate,
			String endDate, HttpServletResponse response) throws IOException {
		JSONObject jsonObject = new JSONObject();
		System.out.println(periodId);
		logger.info("生成播表");

		String uid = (String) request.getSession().getAttribute("userId");
		if (uid == null || "".equals(uid)) {
			PrintWriter out = response.getWriter();
			jsonObject.put("stateCode", "1");
			out.print(jsonObject);
			out.flush();
			out.close();
		} else {
			if ("".equals(startDate) || "".equals(endDate)) {
				PrintWriter out = response.getWriter();
				jsonObject.put("stateCode", "2");
				out.print(jsonObject);
				out.flush();
				out.close();
			} else if (TimeUtil.checkTime(startDate, endDate)) {
				Map generateRecallMap = commonService.generateTb(periodId, uid, startDate, endDate);
				if ((boolean) generateRecallMap.get("isSuccess")) {
					PrintWriter out = response.getWriter();
					jsonObject.put("stateCode", "true");
					jsonObject.put("ignorePidsList", generateRecallMap.get("ignorePidsList"));
					out.print(jsonObject);
					out.flush();
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					jsonObject.put("stateCode", "false");
					out.print(jsonObject);
					out.flush();
					out.close();
				}
			} else {
				PrintWriter out = response.getWriter();
				jsonObject.put("stateCode", "3");
				out.print(jsonObject);
				out.flush();
				out.close();
				// if(commonService.generateTable(periodId, uid)) {
			}
		}
	}

	@RequestMapping("/fildIPtable")
	@ResponseBody
	public PageResultData<PtableDto> fildIPtable(String terminalId, String field, String order, int page, int limit) {
		// List<IPTable> list = new ArrayList<IPTable>();
		List<Terminal> list = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = commonService.getAllUser();
		if ("".equals(terminalId) || terminalId == null) {
			String[] params = new String[0];
			try {
				Page pageD = commonService.pageSearchInsertByTemplateHQL(params, page, limit, "PlayTable", field+" "+order,
						null);
				List<PlayTable> listPtable = pageD.getList();
				//List<PtableDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
				List<PtableDto> listDto = EntityUtil.ptableDtoInsert(list, listPeriod, listUser, listPtable, ptableDao);
				PageResultData<PtableDto> pageResult = new PageResultData<PtableDto>();
				pageResult.setCount(pageD.getTotalRecord());
				pageResult.setCode(0);
				pageResult.setMsg("");
				pageResult.setData(listDto);
				return pageResult;
			} catch (Exception e) {
				e.printStackTrace();
				PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
				pageResult1.setCount(0);
				pageResult1.setCode(0);
				pageResult1.setFail(1);
				pageResult1.setMsg("查询失败");
				return pageResult1;
			}
		} else {
			String[] params = new String[3];
			params[0] = "terminalId";
			params[1] = "=";
			params[2] = terminalId;
			try {
				Page pageD = commonService.pageSearchInsertByTemplateHQL(params, page, limit, "PlayTable", "pid asc",
						null);
				List<PlayTable> listPtable = pageD.getList();
				//List<PtableDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
				List<PtableDto> listDto = EntityUtil.ptableDtoInsert(list, listPeriod, listUser, listPtable, ptableDao);
				PageResultData<PtableDto> pageResult = new PageResultData<PtableDto>();
				pageResult.setCount(pageD.getTotalRecord());
				pageResult.setCode(0);
				pageResult.setMsg("");
				pageResult.setData(listDto);
				return pageResult;
			} catch (Exception e) {
				e.printStackTrace();
				PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
				pageResult1.setCount(0);
				pageResult1.setCode(0);
				pageResult1.setFail(1);
				pageResult1.setMsg("查询失败");
				return pageResult1;
			}
		}
	}

	@RequestMapping("/resetPtable")
	public void resetPtable(HttpServletResponse response) throws IOException, ParseException {
		PlayTableTask ps = new PlayTableTask();
		ps.getFileMessage();
		ps.generateTable();
		PrintWriter out = response.getWriter();
		out.print("true");
		out.flush();
		out.close();
	}
	//包括插播
	@RequestMapping(value = "/searchAllPtable")
	public @ResponseBody PageResultData<PtableDto> searchAllPtable(String terminalId, String statusId, String startDate,
																String endDate, int page, int limit) throws ParseException {
		String[] param = initParam(terminalId, statusId);
		List<Terminal> list = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = commonService.getAllUser();
		//String whereSuffix = " and insertFlag != 1";
		if (!"".equals(startDate) && !"".equals(endDate)) {
			Date d1 = TimeUtil.translateDate(startDate);
			Date d2 = TimeUtil.translateDate(endDate);
			if (!TimeUtil.dateValidate(d1, d2)) {
				PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
				pageResult1.setCount(0);
				pageResult1.setFail(1);
				pageResult1.setCode(0);
				pageResult1.setMsg("时间前后有误!!");
				return pageResult1;
			}
		}
		try {
			Page pageD = commonService.pageSearchPtableByTemplateHQL(startDate, endDate, param, page, limit,
					"PlayTable", "play_date desc", null);
			List<PlayTable> listPtable = pageD.getList();
			List<PtableDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
			PageResultData<PtableDto> pageResult = new PageResultData<PtableDto>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(listDto);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("查询失败");
			return pageResult1;
		}
		// try {
		// Page page = commonService.pageSearchByTemplateHQL(params, currentPage,
		// pageSize, "PlayTable", "pid asc", null);
		// return new Result(true, page);
		// } catch (Exception e) {
		// e.printStackTrace();
		// return new Result("查询失败");
		// }
	}
	//除去插播
	@RequestMapping(value = "/searchPtable")
	public @ResponseBody PageResultData<PtableDto> searchPtable(String terminalId, String statusId, String startDate,
			String endDate, int page, int limit) throws ParseException {
		String[] param = initParam(terminalId, statusId);
		List<Terminal> list = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = commonService.getAllUser();
		String whereSuffix = " and insertFlag != 1";
		if (!"".equals(startDate) && !"".equals(endDate)) {
			Date d1 = TimeUtil.translateDate(startDate);
			Date d2 = TimeUtil.translateDate(endDate);
			if (!TimeUtil.dateValidate(d1, d2)) {
				PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
				pageResult1.setCount(0);
				pageResult1.setFail(1);
				pageResult1.setCode(0);
				pageResult1.setMsg("时间前后有误!!");
				return pageResult1;
			}
		}
		try {
			Page pageD = commonService.pageSearchPtableByTemplateHQL(startDate, endDate, param, page, limit,
					"PlayTable", "play_date desc", whereSuffix);
			List<PlayTable> listPtable = pageD.getList();
			List<PtableDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
			PageResultData<PtableDto> pageResult = new PageResultData<PtableDto>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(listDto);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("查询失败");
			return pageResult1;
		}
		// try {
		// Page page = commonService.pageSearchByTemplateHQL(params, currentPage,
		// pageSize, "PlayTable", "pid asc", null);
		// return new Result(true, page);
		// } catch (Exception e) {
		// e.printStackTrace();
		// return new Result("查询失败");
		// }
	}

	@RequestMapping(value = "/searchPtable1")
	public @ResponseBody PageResultData<PtableDto> searchPtable1(String terminalId, String statusId, String startDate,
																String endDate,String field, String order, int page, int limit) throws ParseException {
		String[] param = initParam(terminalId, statusId);
		List<Terminal> list = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = commonService.getAllUser();
		if (!"".equals(startDate) && !"".equals(endDate)) {
			Date d1 = TimeUtil.translateDate(startDate);
			Date d2 = TimeUtil.translateDate(endDate);
			if (!TimeUtil.dateValidate(d1, d2)) {
				PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
				pageResult1.setCount(0);
				pageResult1.setFail(1);
				pageResult1.setCode(0);
				pageResult1.setMsg("时间前后有误!!");
				return pageResult1;
			}
		}
		try {
			Page pageD = commonService.pageSearchPtableByTemplateHQL(startDate, endDate, param, page, limit,
					"PlayTable", field + " " + order, null);
			List<PlayTable> listPtable = pageD.getList();
			List<PtableDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
			PageResultData<PtableDto> pageResult = new PageResultData<PtableDto>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(listDto);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("查询失败");
			return pageResult1;
		}
		// try {
		// Page page = commonService.pageSearchByTemplateHQL(params, currentPage,
		// pageSize, "PlayTable", "pid asc", null);
		// return new Result(true, page);
		// } catch (Exception e) {
		// e.printStackTrace();
		// return new Result("查询失败");
		// }
	}

	@RequestMapping(value = "/searchMarquee")
	public @ResponseBody PageResultData<MarqueeDto> searchMarquee(String terminalId, String statusId, String startDate,
			String endDate, int page, int limit) throws ParseException {
		String[] param = initParam(terminalId, statusId);
		List<Terminal> list = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = commonService.getAllUser();
		if (!"".equals(startDate) && !"".equals(endDate)) {
			Date d1 = TimeUtil.translateDate(startDate);
			Date d2 = TimeUtil.translateDate(endDate);
			if (!TimeUtil.dateValidate(d1, d2)) {
				PageResultData<MarqueeDto> pageResult1 = new PageResultData<MarqueeDto>();
				pageResult1.setCount(0);
				pageResult1.setFail(1);
				pageResult1.setCode(0);
				pageResult1.setMsg("时间前后有误!!");
				return pageResult1;
			}
		}
		try {
//			Page pageD = commonService.pageSearchPtableByTemplateHQL(startDate, endDate, param, page, limit,
//					"Marquee", "play_date desc", null);
			Page pageD = commonService.pageSearchFirstByTemplateHQL(param, page, limit, "Marquee", "create_time desc", null);
			List<Marquee> listMaquee = pageD.getList();
			//List<PtableDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
			List<MarqueeDto> listDto = EntityUtil.getMarqueeDtoInfo(listMaquee, list, listPeriod);
			System.out.println("MarqueeDto:"+listDto);
			PageResultData<MarqueeDto> pageResult = new PageResultData<MarqueeDto>();
			//List<Marquee> listPtable = pageD.getList();
			//List<MarqueeDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
			//PageResultData<PtableDto> pageResult = new PageResultData<PtableDto>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(listDto);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<MarqueeDto> pageResult1 = new PageResultData<MarqueeDto>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("查询失败");
			return pageResult1;
		}
		// try {
		// Page page = commonService.pageSearchByTemplateHQL(params, currentPage,
		// pageSize, "PlayTable", "pid asc", null);
		// return new Result(true, page);
		// } catch (Exception e) {
		// e.printStackTrace();
		// return new Result("查询失败");
		// }
	}

	private String[] initParam(String terminalId, String statusId) {
		int k = 0;
		if (!"".equals(terminalId)) {
			k++;
		}
		if (!"".equals(statusId)) {
			k++;
		}
		String[] param = new String[k * 3];
		int len = 0;
		if (!"".equals(terminalId)) {
			param[len] = "terminalId";
			len++;
			param[len] = "=";
			len++;
			param[len] = terminalId;
			len++;
		}
		if (!"".equals(statusId)) {
			param[len] = "statusId";
			len++;
			param[len] = "=";
			len++;
			param[len] = statusId;
			len++;
		}
		return param;
	}

	@RequestMapping(value = "/searchUnckeckFirstPtable")
	public @ResponseBody PageResultData<PtableDto> searchUnckeckFirstPtable(String statusId, int page, int limit, String sortName, String sortBy) {
		String[] param = initUncheckParam(statusId);
		List<Terminal> list = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = commonService.getAllUser();
		String sortString = "createTime desc";
		if (sortName != null && sortBy != null) {
			sortString = sortName + " " + sortBy;
		}
		try {
			Page pageD = commonService.pageSearchFirstByTemplateHQL(param, page, limit, "PlayTable", sortString, null);
			List<PlayTable> listPtable = pageD.getList();
			List<PtableDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
			PageResultData<PtableDto> pageResult = new PageResultData<PtableDto>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(listDto);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("查询失败");
			return pageResult1;
		}
	}
	
	@RequestMapping(value = "/searchUnckeckFirstMarquee")
	public @ResponseBody PageResultData<MarqueeDto> searchUnckeckFirstMarquee(String statusId, int page, int limit, String sortName, String sortBy) {
		String[] param = initUncheckParam(statusId);
		List<Terminal> list = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = commonService.getAllUser();
		String sortString = "createTime desc";
		if (sortName != null && sortBy != null) {
			sortString = sortName + " " + sortBy;
		}
		try {
			Page pageD = commonService.pageSearchFirstByTemplateHQL(param, page, limit, "Marquee", sortString, null);
			List<Marquee> listMaquee = pageD.getList();
			System.out.println(listMaquee);
			//List<PtableDto> listDto = EntityUtil.ptableDto(list, listPeriod, listUser, listPtable);
			List<MarqueeDto> listDto = EntityUtil.getMarqueeDtoInfo(listMaquee, list, listPeriod);
			PageResultData<MarqueeDto> pageResult = new PageResultData<MarqueeDto>();
			pageResult.setCount(pageD.getTotalRecord());
			pageResult.setCode(0);
			pageResult.setMsg("");
			pageResult.setData(listDto);
			return pageResult;
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<MarqueeDto> pageResult1 = new PageResultData<MarqueeDto>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("查询失败");
			return pageResult1;
		}
	}

	private String[] initUncheckParam(String statusId) {
		int k = 0;
		if (!"".equals(statusId)) {
			k++;
		}
		String[] param = new String[k * 3];
		int len = 0;
		if (!"".equals(statusId)) {
			param[len] = "statusId";
			len++;
			param[len] = "=";
			len++;
			param[len] = statusId;
			len++;
		}
		return param;
	}

	@RequestMapping(value = "/searchUnckeckSecondPtable")
	public @ResponseBody Result searchUnckeckSecondPtable(String[] params, int currentPage, int pageSize) {
		try {
			Page page = commonService.pageSearchSecondByTemplateHQL(params, currentPage, pageSize, "PlayTable",
					"pid asc", null);
			return new Result(true, page);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result("查询失败");
		}
	}

	@RequestMapping(value = "/insertPtable")
	public @ResponseBody Result insertPtable(String insertDate, String intervalTime, String interval, String terminalId,
			String materialName, String status, String[] fids, HttpSession session) {
		try {
			// 后台校验
			if (fids == null || fids.length == 0 || fids.length > 1)
				return new Result("插播保存失败,缺少相关参数");
			if ("".equals(insertDate))
				return new Result("插播保存失败,缺少相关参数");
			if ("".equals(intervalTime))
				return new Result("插播保存失败,缺少相关参数");
			if ("".equals(interval))
				return new Result("插播保存失败,缺少相关参数");
			if ("".equals(terminalId))
				return new Result("插播保存失败,缺少相关参数");

			IPTable insert = new IPTable();
			Date d = TimeUtil.translateDate(insertDate);
			insert.setInsertDate(d);
			String[] time = intervalTime.split("-");
			java.sql.Time startTime = TimeUtil.translateTime(time[0].trim());
			java.sql.Time endTime = TimeUtil.translateTime(time[1].trim());
			if (TimeUtil.timeValidate(startTime, endTime)) {
				insert.setMaterialName(materialName);
				insert.setStartTime(startTime);
				insert.setEndTime(endTime);
				insert.setMin(Integer.parseInt(interval));
				insert.setStatus(Integer.parseInt(status));
				insert.setMid(fids[0]);
				insert.setTerminalId(terminalId);
				String name = (String) session.getAttribute("userName");
				insert.setCreateName(name);
				// Date date = new Date();
				// Timestamp timestamp = new Timestamp(date.getTime());
				insert.setCreateTime(new Timestamp(System.currentTimeMillis()));
				insert.setDeleted(0);
				System.out.println(insert);
				// ptableDao.saveInsertTable(insert);
				ptableService.saveInsertTable(insert);
				return new Result(true, "");
			} else {
				return new Result("插播时段有误");
			}

			// 唯一性验证
			// if(ptableService.countByName(playTable) > 0) return new Result("播表名称已经被占用");

			// 先插入一条播放表记录
			// ptableDao.save(playTable);

			// 建立播放表与视频文件的关系
			// ptableService.buildPtableFileRelation(playTable.getPid(), fids);

		} catch (Exception e) {
			e.printStackTrace();
			return new Result("插播保存失败");
		}
	}

	@RequestMapping(value = "/modifyPtable")
	public @ResponseBody Result modifyPtable(String pid, String pname, String[] fids) {
		try {
			// 后台校验
			if (StringUtil.isEmpty(pid) || StringUtil.isEmpty(pname) || fids == null || fids.length == 0)
				return new Result("修改播表失败,缺少相关参数");

			// 先检验播表名称有无占用
			PlayTable playTable = ptableDao.load(pid);
			if (ptableService.countByName(playTable) > 0)
				return new Result("播表名称已经被占用");

			// 开始更新播表的数据
			// 更新的参数
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("pname", pname);
			// 更新的where条件
			Map<String, String> whereMap = new HashMap<String, String>();
			whereMap.put("pid", pid);
			// 开始更新数据
			commonService.updateByTemplateHQL(SqlUtil.growUpdateHqlTemplate("PlayTable", paramMap, whereMap), paramMap,
					whereMap);
			// 建立播放表与视频文件的关系
			ptableService.buildPtableFileRelation(pid, fids);

			// 如果更新了播表的名称，需要级联更新终端的播表
			// if(!pname.equals(oldPname)) {
			// paramMap = new HashMap<String, String>();
			// paramMap.put("pname", pname);
			// //更新的where条件
			// whereMap = new HashMap<String, String>();
			// whereMap.put("pid", pid);
			// //开始更新播放表数据
			// commonService.updateByTemplateHQL(SqlUtil.growUpdateHqlTemplate("Terminal",
			// paramMap, whereMap), paramMap, whereMap);
			// }

			return new Result(true, "");
		} catch (Exception e) {
			e.printStackTrace();
			return new Result("修改播表失败");
		}
	}

	@RequestMapping(value = "/delPtable")
	public @ResponseBody Result delPtable(String[] ids) {
		if (ids == null || ids.length < 1) {
			return new Result("删除错误");
		}

		// 已经审核不允许删除
		for (int i = 0; i < ids.length; i++) {
			PlayTable ptable = ptableService.getPlayTableByPid(ids[i]);
			if (!"1".equals(ptable.getStatusId())) {
				return new Result("删除错误，已审核播表不允许删除！");
			}
		}

		// 开始更新数据
		try {
			ptableService.deletePtable(ids);
			return new Result(true, "");
		} catch (Exception e) {
			e.printStackTrace();
			return new Result("删除错误，服务器执行异常！");
		}

	}

	// 7.15
	@RequestMapping(value = "/goModifyPtable/{pid}/{periodName}/{tid}")
	public String goModifyPtable(@PathVariable String pid, @PathVariable String periodName, @PathVariable String tid,
			ModelMap modelMap) {
		boolean playTableIsUnChecked = false;
		PlayTable playTable = ptableDao.getById(pid);
		if (playTable.getStatusId() != null && "1".contentEquals(playTable.getStatusId())) {
			playTableIsUnChecked = true;
		}
		//计算最大公约数
		modelMap.addAttribute("ptableStyle", "ptablelist");
		modelMap.addAttribute("pid", pid);
		modelMap.addAttribute("periodName", periodName);
		modelMap.addAttribute("periodID", playTable.getPeriodId());
		modelMap.addAttribute("tid", tid);
		modelMap.addAttribute("isUnChecked", playTableIsUnChecked);
		modelMap.addAttribute("playTableName", playTable.getPtableName());
		modelMap.addAttribute("playTablePlayDate", new SimpleDateFormat("yyyy-MM-dd").format(playTable.getPlayDate()));
		modelMap.addAttribute("startTime",playTable.getStartTime());
		modelMap.addAttribute("endTime",playTable.getEndTime());
		modelMap.addAttribute("insertFlag",playTable.getInsertFlag());
		modelMap.addAttribute("min",playTable.getMin());

		modelMap.addAttribute("playTableDuration", playTable.getPlayTotalTime());
		modelMap.addAttribute("playTableMaxCommonDivisor", playTable.getBaseFrequency());//基础频次，最大公约数
		
		return "ptable/addPtable";
	}

	@RequestMapping(value = "/goShowPtable/{pid}")
	public String showPtable(@PathVariable String pid, ModelMap modelMap, HttpServletRequest request) {

		PlayTable ptb = ptableDao.getById(pid);
		modelMap.addAttribute("pid", pid);
		modelMap.addAttribute("periodName", ptb.getPtableName());
		modelMap.addAttribute("tid", ptb.getTerminalId());
		
		modelMap.addAttribute("playTableDuration", ptb.getPlayTotalTime());
		modelMap.addAttribute("playTableMaxCommonDivisor", ptb.getBaseFrequency());//基础频次，最大公约数

		List<Material> files = fileDao.findByPtable(pid);
		request.getSession().setAttribute("tableFirst", files);
		String rid = (String) request.getSession().getAttribute("rId");
		request.getSession().setAttribute("modifyPid", pid);
		return "ptable/showPtable";
	}

	@RequestMapping(value = "/goCheckPtableFirst/{pid}")
	public String goCheckPtable(@PathVariable String pid, ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("pid", pid);
		PlayTable playTable = ptableDao.getById(pid);
		modelMap.addAttribute("playTablePlayDate", new SimpleDateFormat("yyyy-MM-dd").format(playTable.getPlayDate()));
		modelMap.addAttribute("startTime",playTable.getStartTime());
		modelMap.addAttribute("endTime",playTable.getEndTime());
		modelMap.addAttribute("insertFlag",playTable.getInsertFlag());
		modelMap.addAttribute("min",playTable.getMin());

		List<Material> files = fileDao.findByPtable(pid);
		request.getSession().setAttribute("tableFirst", files);
		String rid = (String) request.getSession().getAttribute("rId");
		request.getSession().setAttribute("modifyPid", pid);
		return "ptable/checkPtable";
	}
	@RequestMapping(value = "/goCheckMarqueeFirst/{mid}")
	public String goCheckMarquee(@PathVariable String mid, ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("mid", mid);
		Material files = materialDao.getById(mid);
		request.getSession().setAttribute("tableFirst", files);
		request.getSession().setAttribute("modifyMid", mid);
		return "ptable/checkMarquee";
	}

	@RequestMapping(value = "/goCheckPtablesFirst/{pids}")
	public String goCheckPtables(@PathVariable String pids, ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("pids", pids);
		String[] pidss = pids.split(",");
		modelMap.addAttribute("pid", pidss[0]);
		List<Material> files = fileDao.findByPtable(pidss[0]);
		request.getSession().setAttribute("tableFirst", files);
		String rid = (String) request.getSession().getAttribute("rId");
		request.getSession().setAttribute("modifyPid", pids);
		return "ptable/checkPtable";
	}

	@RequestMapping(value = "/goCheckPtableFinal/{pid}")
	public String goCheckPtableFinal(@PathVariable String pid, ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("pid", pid);
		PlayTable playTable = ptableDao.getById(pid);
		modelMap.addAttribute("playTablePlayDate", new SimpleDateFormat("yyyy-MM-dd").format(playTable.getPlayDate()));
		modelMap.addAttribute("startTime",playTable.getStartTime());
		modelMap.addAttribute("endTime",playTable.getEndTime());
		modelMap.addAttribute("insertFlag",playTable.getInsertFlag());
		modelMap.addAttribute("min",playTable.getMin());

		List<Material> files = fileDao.findByPtable(pid);
		request.getSession().setAttribute("tableFirst", files);
		String rid = (String) request.getSession().getAttribute("rId");
		request.getSession().setAttribute("modifyPid", pid);
		return "ptable/checkPtableFinal";
	}

	@RequestMapping(value = "/goCheckPtablesFinal/{pids}")
	public String goCheckPtablesFinal(@PathVariable String pids, ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("pids", pids);
		String[] pidss = pids.split(",");
		modelMap.addAttribute("pid", pidss[0]);
		List<Material> files = fileDao.findByPtable(pidss[0]);
		request.getSession().setAttribute("tableFirst", files);
		String rid = (String) request.getSession().getAttribute("rId");
		request.getSession().setAttribute("modifyPid", pids);
		return "ptable/checkPtableFinal";
	}
	
	@RequestMapping(value = "/goCheckMarqueeFinal/{mid}")
	public String goCheckMarqueeFinal(@PathVariable String mid, ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("mid", mid);
		Material files = materialDao.getById(mid);
		request.getSession().setAttribute("tableFirst", files);
		request.getSession().setAttribute("modifyMid", mid);
		return "ptable/checkMarqueeFinal";
	}

	@RequestMapping(value = "/getTableSortNum")
	public void getTableSortNum(String ppid, ModelMap modelMap, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		modelMap.addAttribute("pid", ppid);
		List<Material> files = fileDao.findByPtable(ppid);
		request.getSession().setAttribute("tableFirst", files);
		String rid = (String) request.getSession().getAttribute("rId");
		request.getSession().setAttribute("modifyPid", ppid);
		PrintWriter out = response.getWriter();
		out.print("true");
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/getMarqueeById")
	public @ResponseBody PageResultData<MarqueeDto> getMarqueeById(HttpServletRequest request,String mid){
		if (StringUtil.isEmpty(mid)) {
			PageResultData<MarqueeDto> pageResult1 = new PageResultData<MarqueeDto>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("获取失败, 没有传入参数");
			return pageResult1;
		}
		try {
			System.out.println(mid);
			// PlayTable playTable = ptableDao.get(pid);
			Marquee marquee = marqueeService.getById(mid);
			System.out.println(marquee.getMarqName());
			List<Marquee> listM = new ArrayList<Marquee>();
			listM.add(marquee);
			String name = marquee.getMarqName();
			if (marquee.getFileType().equals("picture")) {
//				List<Items> files = materialDao.findByPtable(mid);
				request.getSession().setAttribute("modifyMid", mid);
//				System.out.println(files);
				
				List<Terminal> listTerminal = commonService.getAllTerminal();
				List<Period> listPeriod = commonService.getAllPeriod();
				List<MarqueeDto> files = EntityUtil.getMarqueeDtoInfo(listM, listTerminal, listPeriod);
				System.out.println(files);
				Map<String, Object> map = new HashMap<String, Object>();
//				map.put("playTable", playTable);
				map.put("files", files);
				PageResultData<MarqueeDto> pageResult = new PageResultData<>();
				pageResult.setCount(files.size());
				pageResult.setCode(0);
				pageResult.setMsg(name);
				pageResult.setFail(0);
				pageResult.setData(files);
				return pageResult;
			} else {
				PageResultData<MarqueeDto> pageResult1 = new PageResultData<>();
				pageResult1.setCount(0);
				pageResult1.setCode(0);
				pageResult1.setMsg("");
				return pageResult1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<MarqueeDto> pageResult1 = new PageResultData<MarqueeDto>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("获取失败");
			return pageResult1;
		}
	}

	@RequestMapping(value = "/getPtableById")
	public @ResponseBody PageResultData<Items> getPtableById(HttpServletRequest request, String pid) {
		if (StringUtil.isEmpty(pid)) {
			PageResultData<Items> pageResult1 = new PageResultData<Items>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("获取失败, 没有传入参数");
			return pageResult1;
		}
		try {
			System.out.println(pid);
			// PlayTable playTable = ptableDao.get(pid);
			PlayTable playTable = ptableDao.getById(pid);
			System.out.println(playTable.getPtableName());
			String name = playTable.getPtableName();
			if (playTable.getInsertFlag() == 0) {
				List<Items> files = materialDao.findByPtable(pid);
				request.getSession().setAttribute("modifyPid", pid);

				System.out.println("下面是从pid = "+pid +  "中查到的对应item：");
				System.out.println(files);

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("playTable", playTable);
				map.put("files", files);
				PageResultData<Items> pageResult = new PageResultData<Items>();

				pageResult.setCount(files.size());
				System.out.println("一共返回了：" + files.size() + "个item");

				pageResult.setCode(0);
				pageResult.setMsg(name);
				pageResult.setFail(0);
				pageResult.setData(files);
				return pageResult;
			} else if (playTable.getInsertFlag() == 1) {
				List<Material> files = materialDao.findMaterialByPtable(pid); //插播查看审核 异常
				List<Items> files1 = EntityUtil.createNewItems(files, playTable);
				request.getSession().setAttribute("modifyPid", pid);
				System.out.println(files);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("playTable", playTable);
				map.put("files", files);
				PageResultData<Items> pageResult = new PageResultData<Items>();
				pageResult.setCount(files.size());
				pageResult.setCode(0);
				pageResult.setMsg(name);
				pageResult.setFail(0);
				pageResult.setData(files1);
				return pageResult;
			} else {
				PageResultData<Items> pageResult1 = new PageResultData<Items>();
				pageResult1.setCount(0);
				pageResult1.setCode(0);
				pageResult1.setMsg("");
				return pageResult1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			PageResultData<Items> pageResult1 = new PageResultData<Items>();
			pageResult1.setCount(0);
			pageResult1.setCode(0);
			pageResult1.setFail(1);
			pageResult1.setMsg("获取失败");
			return pageResult1;
		}
	}

	/**
	 * 返回去重排序后的播表稿件列表，以ajax方式，json类型传回前端
	 * 
	 * @param pid
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/getDistinctMaterialsByPidSortByName")
	public void getDistinctMaterialsByPidSortByName(String pid, HttpServletRequest request,
			HttpServletResponse response) {
		JSONArray jsonArray = new JSONArray();
		if (StringUtil.isEmpty(pid)) {
			return;
		}
		try {
			System.out.println("pid:"+pid);
			PlayTable playTable = ptableDao.getById(pid);
			System.out.println(playTable.getPtableName());
			String name = playTable.getPtableName();

			if (playTable.getInsertFlag() == 0) {
				List<Items> files = materialDao.findByPtable(pid);
				HashSet<Items> hashSet = new HashSet<Items>();
				ArrayList<Items> distinctMaterialsList = new ArrayList<Items>();
				for (Items items : files) {
					if (hashSet.add(items)) {
						distinctMaterialsList.add(items);
					}
				}

				Collections.sort(distinctMaterialsList, new Comparator<Items>() {
					@Override
					public int compare(Items i1, Items i2) {
						Collator collator = Collator.getInstance(Locale.CHINA);
						return collator.compare(i1.getMaterialName(), i2.getMaterialName());
					}
				});

				for (int i = 0; i < distinctMaterialsList.size(); i++) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("num", i + 1);
					jsonObject.put("name", distinctMaterialsList.get(i).getMaterialName());
					jsonObject.put("frequncy", distinctMaterialsList.get(i).getFrequency());
					jsonObject.put("duration", distinctMaterialsList.get(i).getDuration());

					jsonArray.add(jsonObject);
				}
				PrintWriter out = response.getWriter();
				System.out.println("json:"+jsonArray.toString());
				out.print(jsonArray);
				out.flush();
				out.close();
			} else if (playTable.getInsertFlag() == 1) {
				List<Material> files = materialDao.findMaterialByPtable(pid);
				List<Items> filesList = EntityUtil.createNewItems(files, playTable);

				Collections.sort(filesList, new Comparator<Items>() {
					@Override
					public int compare(Items i1, Items i2) {
						Collator collator = Collator.getInstance(Locale.CHINA);
						return collator.compare(i1.getMaterialName(), i2.getMaterialName());
					}
				});

				for (int i = 0; i < filesList.size(); i++) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("num", i + 1);
					jsonObject.put("name", filesList.get(i).getMaterialName());
					jsonObject.put("frequncy", filesList.get(i).getFrequency());
					jsonObject.put("duration", filesList.get(i).getDuration());

					jsonArray.add(jsonObject);
				}
				PrintWriter out = response.getWriter();
				out.print(jsonArray);
				out.flush();
				out.close();
			} else {
				PrintWriter out = response.getWriter();
				out.print(jsonArray);
				out.flush();
				out.close();
			}
		} catch (Exception e) {
		}
	}
	
	@RequestMapping(value = "/modifyMarqueeNum")
	public void modifyMarqueeNum(String mid, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("LOGO/图片叠加审核");
		String userId=(String) request.getSession().getAttribute("userId");
		String userName = userDao.getuserNameByid(userId);
		marqueeService.updateMarqueeStatus(mid,userName,"","2");
		PrintWriter out = response.getWriter();
		out.print("true");
		out.flush();
		out.close();
		
	}
	
	/**
	 * 播表初级审核
	 * 
	 * @param ppid
	 * @param model
	 * @param request
	 * @param response
	 * @param sortNum
	 * @throws IOException
	 */
	@RequestMapping(value = "/modifyPlayTableNum")
	public void modifyPlayTableNum(String[] ppid, Model model, HttpServletRequest request, HttpServletResponse response,
			String sortNum) throws IOException, ParseException {
		// System.out.println(ppid + "=" + sortNum);
		// System.out.println("pid=" + (String)
		// request.getSession().getAttribute("modifyPid"));
		logger.info("播表初级审核");
		if ("".equals(sortNum)) {
			// String pid = (String) request.getSession().getAttribute("modifyPid");
			for (int i = 0; i < ppid.length; i++) {
				ptableService.updateTableStatus(ppid[i]);
				PrintWriter out = response.getWriter();
				out.print("true");
				out.flush();
				out.close();
			}
		} else {
			// String pid = (String) request.getSession().getAttribute("modifyPid");
			// System.out.println(pid);
			for (int i = 0; i < ppid.length; i++) {
				ptableService.modifyPlayTableNum(ppid[i], sortNum);
				ptableService.updateTableStatus(ppid[i]);
				// int num = Integer.parseInt((String)
				// request.getSession().getAttribute("playNum"));
				// request.getSession().setAttribute("playNum", num - 1);
				int num = userDao.getAccountTable(1);
				String n = "" + num;
				request.getSession().setAttribute("playNum", n);
				PrintWriter out = response.getWriter();
				out.print("true");
				out.flush();
				out.close();
			}
		}
	}

	// 添加仅修改播表顺序的接口
	@RequestMapping(value = "/modifyPlayTableNumFromaddPtable")
	public void modifyPlayTableNumFromaddPtable(String ppid, Model model, HttpServletRequest request,
			HttpServletResponse response, String sortNum) throws IOException {
		System.out.println(ppid + "=" + sortNum);
		// System.out.println("pid=" + (String)
		// request.getSession().getAttribute("modifyPid"));
		logger.info("修改播表顺序");
		if ("".equals(sortNum)) {
			// String pid = (String) request.getSession().getAttribute("modifyPid");

			PrintWriter out = response.getWriter();
			out.print("false");
			out.flush();
			out.close();
		} else {
			// String pid = (String) request.getSession().getAttribute("modifyPid");
			// System.out.println(pid);
			ptableService.modifyPlayTableNum(ppid, sortNum);
			// ptableService.updateTableStatus(ppid);
			// int num = Integer.parseInt((String)
			// request.getSession().getAttribute("playNum"));
			// request.getSession().setAttribute("playNum", num - 1);
			int num = userDao.getAccountTable(1);
			String n = "" + num;
			request.getSession().setAttribute("playNum", n);
			PrintWriter out = response.getWriter();
			out.print("true");
			out.flush();
			out.close();
		}
	}
	@RequestMapping(value = "/modifyMarqueeFinalNum")
	public void modifyMarqueeFinalNum(String mid, Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("print by PtableControll.modifyMarqueeFinalNum");
		logger.info("LOGO/图片叠加终审");
		String userId=(String) request.getSession().getAttribute("userId");
		String userName = userDao.getuserNameByid(userId);
		Timer timer = new Timer();
		marqueeService.updateMarqueeStatus(mid,"",userName,"3");
		Marquee marquee = marqueeService.getById(mid);
		// 判断跑马灯是否立即生效，如果生效，需要更新播表
		try {
			if (TimeUtil.isTodayBetween(marquee.getStartDate(), marquee.getEndDate())) {
				timer.schedule(new TimerTask() {
					@Override
					public void run() {
						if (restartTerminalAfterAudit(marquee.getTerminalId())) {
							timer.cancel();
						}
					}
				}, 3000, 60000); // 指定启动定时器3s之后运行定时器任务run方法，并且若未终止，间隔10s一直执行

			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print("true");
		out.flush();
		out.close();
	}
	

	/**
	 * 播表终级审核，审核通过后重启终端，更新播表
	 * 
	 * @param ppid
	 * @param model
	 * @param request
	 * @param response
	 * @param sortNum
	 * @throws IOException
	 */
	@RequestMapping(value = "/modifyPlayTableFinalNum")
	public void modifyPlayTableFinalNum(String[] ppid, Model model, HttpServletRequest request,
			HttpServletResponse response, String sortNum) throws IOException, ParseException {
		System.out.println("print by PtableControll.modifyPlayTableFinalNum():" + ppid + "=" + sortNum);
		logger.info("播表终审");
		logger.info("print by PtableControll.modifyPlayTableFinalNum():" + ppid + "=" + sortNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String todayStr = sdf.format(new Date());
		Timer timer = new Timer();
		if ("".equals(sortNum)) {
			// String pid = (String) request.getSession().getAttribute("modifyPid");
			for (int i = 0; i < ppid.length; i++) {
				ptableService.updateTableStatusFinal(ppid[i]);
				PlayTable pt = ptableDao.get(ppid[i]);
				// 判断播表是否在播，如果在播，需要更新播表
				if (todayStr.equals(sdf.format(pt.getPlayDate()))) {
					timer.schedule(new TimerTask() {
						@Override
						public void run() {
							if (restartTerminalAfterAudit(pt.getTerminalId())) {
								timer.cancel();
							}
						}
					}, 3000, 60000); // 指定启动定时器3s之后运行定时器任务run方法，并且若未终止，间隔10s一直执行

				}
				PrintWriter out = response.getWriter();
				out.print("true");
				out.flush();
				out.close();
			}
		} else {
			// String pid = (String) request.getSession().getAttribute("modifyPid");
			// List<File> list = (List<File>)
			// request.getSession().getAttribute("tableFirst");
			// System.out.println(list);
			// System.out.println(pid);
			for (int i = 0; i < ppid.length; i++) {
				ptableService.modifyPlayTableNum(ppid[i], sortNum);
				ptableService.updateTableStatusFinal(ppid[i]);
				PlayTable pt = ptableDao.get(ppid[i]);
				// 判断播表是否在播，如果在播，需要更新播表
				if (todayStr.equals(sdf.format(pt.getPlayDate()))) {
					timer.schedule(new TimerTask() {
						@Override
						public void run() {
							if (restartTerminalAfterAudit(pt.getTerminalId())) {
								timer.cancel();
							}
						}
					}, 30000, 120000); // 指定启动定时器3s之后运行定时器任务run方法，并且若未终止，间隔10s一直执行
				}
				// int num = Integer.parseInt((String)
				// request.getSession().getAttribute("playNum"));
				// request.getSession().setAttribute("playNum", num - 1);
				int num = userDao.getAccountTable(2);
				request.getSession().setAttribute("playNum", "" + num);
				PrintWriter out = response.getWriter();
				out.print("true");
				out.flush();
				out.close();
			}
		}
	}

	/**
	 * 播表审核通过后，更新播放器端播表，并重启播放器，应用新播表
	 * 
	 * @param terminalId
	 * @throws InterruptedException 
	 */
	public boolean restartTerminalAfterAudit(String terminalId) {
		if (NettyChannelMap.get(terminalId) != null) {
			Terminal termianlRs = terminalService.get(terminalId);
			// 重启终端
			SimpleDateFormat format1 = new SimpleDateFormat("HH:mm:ss");
			System.out.println("channel server Rs=" + NettyChannelMap.get(termianlRs.getTerminalId()));
			System.out.println("channel length Rs= " + NettyChannelMap.getMap().size());
			// 重启客户端
			ResultMsg resultMsgRs = new ResultMsg(true, MsgType.restartTerminal);
			// 返回播放端的主键
			Map<String, Object> dataRs = new HashMap<String, Object>();
			dataRs.put(DataKey.TerminalId, termianlRs.getTerminalId());
			dataRs.put(DataKey.TerminalName, termianlRs.getTerminalName());
			dataRs.put(DataKey.startSpotTop, termianlRs.getStartSpotTop());
			dataRs.put(DataKey.startSpotLeft, termianlRs.getStartSpotLeft());
			dataRs.put(DataKey.ledWidth, termianlRs.getLedWidth());
			dataRs.put(DataKey.ledLength, termianlRs.getLedLength());
			// 返回播放端的播放表有哪些视频列表
			List<FileInfoDto> vediofilesRs = new ArrayList<FileInfoDto>();
			System.out.println(dataRs);
			List<PlayTable> playsRs = ptableService.findPlayTablesByTerminalId(termianlRs.getTerminalId());

			if (playsRs.size() != 0) {
				for (PlayTable pt : playsRs) {
					if (pt.getInsertFlag() == 1)
						continue; // 是插播的话直接跳过
					List<Material> fs = fileDao.findByPtable(pt.getPid());
					for (Material f : fs) {
						System.out.println(f);
					}
					Period period = fileDao.findByPeriod(pt.getPeriodId());
					FileInfoDto fileInfo = new FileInfoDto();
					fileInfo.setFlag(0);
					fileInfo.setPeriodId(pt.getPeriodId());
					fileInfo.setPname(pt.getPtableName());
					fileInfo.setPid(pt.getPid());
					fileInfo.setStart(format1.format(period.getStartInterval()));
					fileInfo.setEnd(format1.format(period.getEndInterval()));
					ArrayList<FileDto> fileDto = new ArrayList<FileDto>();
					for (Material file : fs) {
						fileDto.add(new FileDto(file.getMid(), StringUtil.getFileName(file.getFilePath()),
								file.getFileName(), file.getMd5()));
					}
					fileInfo.setListFile(fileDto);
					vediofilesRs.add(fileInfo);
				}
				System.out.println("Rs=" + vediofilesRs.size());
				System.out.println("Rs=" + vediofilesRs);
				SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");

				// 插播
				List<InsertDto> insertDtoRs = new ArrayList<InsertDto>();
				List<PlayTable> ipTableRs = ptableService.findInsertPlayTablesByTerminalId(termianlRs.getTerminalId());
				if (ipTableRs.size() == 0 || ipTableRs == null) {
					System.out.println("插播为空");
				} else {
					for (PlayTable ip : ipTableRs) {
						List<Material> listMaterial = ptableService.findAllMaterialsByPlayTableId(ip.getPid());
						InsertDto dto = new InsertDto();
						int sum = 0;
						List<String> mid = new ArrayList<String>();
						List<String> fileName = new ArrayList<String>();
						List<String> logicName = new ArrayList<String>();
						List<String> md5 = new ArrayList<String>();
						for (Material m : listMaterial) {
							mid.add(m.getMid());
							String[] insertFileName = m.getFilePath().split("/");
							fileName.add(insertFileName[insertFileName.length - 1]);
							logicName.add(m.getMaterialName());
							md5.add(m.getMd5());
							sum = sum + m.getDuration();
						}
						dto.setEnd(format.format(ip.getEndTime()));
						dto.setStart(format.format(ip.getStartTime()));
						dto.setStatus("" + ip.getState());
						dto.setMin("" + ip.getMin());
						dto.setDuration("" + sum);
						dto.setMid(mid);
						dto.setFileName(fileName);
						dto.setLogicName(logicName);
						dto.setMd5(md5);
						insertDtoRs.add(dto);
					}
					System.out.println("insertDataRs=" + insertDtoRs);
				}
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				Date now = new Date();
				String today = format2.format(now);
				List<Marquee> marquees = marqueeService.findMarqueeByTerminalIdBetweenDates(terminalId, today, today);
				System.out.println(marquees);
				List<MarqueeInfoDto> marqueeFiles = new ArrayList<MarqueeInfoDto>();
				if(marquees.size()>0) { //有需要播放的跑马灯
					for(Marquee marquee : marquees )
					{
						ArrayList<FileDto> fileDto = new ArrayList<FileDto>();
						MarqueeInfoDto marqueeInfoDto = new MarqueeInfoDto();
						Period period = fileDao.findByPeriod(marquee.getPeriodId());
						marqueeInfoDto.setMarqueeName(marquee.getMarqName());
						marqueeInfoDto.setPeriodId(marquee.getPeriodId());
						marqueeInfoDto.setMid(marquee.getMaterialId());
						marqueeInfoDto.setPositionX(marquee.getPositionX());
						marqueeInfoDto.setPositionY(marqueeInfoDto.getPositionY());
						FileDto file = new FileDto(marquee.getMaterialId(), StringUtil.getFileName(marquee.getFilePath()), marquee.getFileName(), marquee.getMd5());
						fileDto.add(file);
						marqueeInfoDto.setFile(fileDto);
						marqueeInfoDto.setStart(format.format(period.getStartInterval()));
						marqueeInfoDto.setEnd(format.format(period.getEndInterval()));
						marqueeFiles.add(marqueeInfoDto);
					}
				}
				dataRs.put(DataKey.MarqueeFiles,marqueeFiles);
				dataRs.put(DataKey.vediofiles, vediofilesRs);
				dataRs.put(DataKey.insertfiles, insertDtoRs);
				resultMsgRs.setData(dataRs);
				ChannelFuture cf = NettyChannelMap.get(terminalId).writeAndFlush(resultMsgRs);
				try {
					Thread.sleep(500);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				if (cf.isSuccess()) {
					System.out.println("在播播表更新成功，成功更新客户端播表！");
					logger.info("在播播表更新成功，成功更新客户端播表！");
					return true;
				} else {
					System.out.println("在播播表更新失败，错误原因，服务器未能成功发送指令到终端，系统将在稍后重试！");
					logger.info("在播播表更新失败，错误原因，服务器未能成功发送指令到终端，系统将在稍后重试！");
					return false;
				}
			}
			System.out.println("在播播表没有更新，未查询到播表！");
			logger.info("在播播表没有更新，未查询到播表！");
			return true;
		} else {
			System.out.println("在播播表更新失败，错误原因：未检测到设备！");
			logger.info("在播播表更新失败，错误原因：未检测到设备！系统将在自动稍后重试！");
			return false;
		}
	}

	@RequestMapping(value = "/modifyPlayTableFinalNumUn")
	public void modifyPlayTableFinalNumUn(String[] ppid, Model model, String mark, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		System.out.println(ppid + "=");
		// String pid = (String) request.getSession().getAttribute("modifyPid");
		for (int i = 0; i < ppid.length; i++) {
			ptableService.updateTableStatusFinalUn(ppid[i], mark);
			PrintWriter out = response.getWriter();
			out.print("true");
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping(value = "/marqueeUnAccess")
	public void marqueeUnAccess(String mid, Model model, String[] checkArray, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println(checkArray.length);
		if (checkArray.length == 0) {
			PrintWriter out = response.getWriter();
			out.print("false");
			out.flush();
			out.close();
		} else {
			if (checkArray.length == 2) {
					marqueeService.marqueeUnAccess(mid, "7");
			} else if (checkArray.length == 1 && "1".equals(checkArray[0])) {
					marqueeService.marqueeUnAccess(mid, "5");
			} else if (checkArray.length == 1 && "2".equals(checkArray[0])) {
					marqueeService.marqueeUnAccess(mid, "6");
			}
			PrintWriter out = response.getWriter();
			out.print("true");
			out.flush();
			out.close();
		 }
	}

	@RequestMapping(value = "/playTableUnAccess")
	public void playTableUnAccess(String[] ppid, Model model, String[] checkArray, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		System.out.println(ppid + "=");
		// String pid = (String) request.getSession().getAttribute("modifyPid");
		System.out.println(checkArray.length);

		// modify by bobo
		// 有理由的默认5
		if (checkArray.length == 0) {
			for (int i = 0; i < ppid.length; i++) {
				ptableService.playTableUnAccess(ppid[i], "5");
			}
		} else {
			if (checkArray.length == 2) {
				for (int i = 0; i < ppid.length; i++) {
					ptableService.playTableUnAccess(ppid[i], "7");
				}
			} else if (checkArray.length == 1 && "1".equals(checkArray[0])) {
				for (int i = 0; i < ppid.length; i++) {
					ptableService.playTableUnAccess(ppid[i], "5");
				}
			} else if (checkArray.length == 1 && "2".equals(checkArray[0])) {
				for (int i = 0; i < ppid.length; i++) {
					ptableService.playTableUnAccess(ppid[i], "6");
				}
			}
			PrintWriter out = response.getWriter();
			out.print("true");
			out.flush();
			out.close();
		}
	}

	@RequestMapping("/broadCheckList")
	public String broadCheckList(Model model, HttpServletRequest request) {
		List<PlayTable> list = new ArrayList<PlayTable>();
		List<PlayTable> list1 = ptableService.getTableById("7");
		List<PlayTable> list2 = ptableService.getTableById("5");
		if (list1.size() != 0) {
			for (PlayTable pt : list1) {
				list.add(pt);
			}
		}
		if (list2.size() != 0) {
			for (PlayTable pt : list2) {
				list.add(pt);
			}
		}

		List<Terminal> listTerminal = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		model.addAttribute("terminals", listTerminal);
		model.addAttribute("periods", listPeriod);
		model.addAttribute("ptableNameOne", list);
		return "file/ptableExcepList";
	}

	@RequestMapping("/checkExcepList")
	public String checkExcepList(Model model, HttpServletRequest request) {
		List<PlayTable> list = new ArrayList<PlayTable>();
		List<PlayTable> list1 = ptableService.getTableById("7");
		List<PlayTable> list2 = ptableService.getTableById("6");
		if (list1.size() != 0) {
			for (PlayTable pt : list1) {
				list.add(pt);
			}
		}
		if (list2.size() != 0) {
			for (PlayTable pt : list2) {
				list.add(pt);
			}
		}

		List<Terminal> listTerminal = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		model.addAttribute("terminals", listTerminal);
		model.addAttribute("periods", listPeriod);
		model.addAttribute("ptableNameOne", list);

		String rid = (String) request.getSession().getAttribute("rId");
		if (rid != null && rid.equals(Constant.adminValue)) {
			model.addAttribute("showDeleteBtn", true);
		} else {
			model.addAttribute("showDeleteBtn", false);
		}

		return "file/checkExcepList";
	}

	// 2018.7.14
	@RequestMapping(value = "/copyOneToPlayFile")
	public void copyOneToPlayFile(String ppid, HttpServletRequest request, HttpServletResponse response, String mmid, String num) throws IOException {
		if (StringUtil.isEmpty(ppid)) {
			PrintWriter out = response.getWriter();
			out.print("获取失败，没有传入ppid");
			out.flush();
			out.close();
		}
		if (StringUtil.isEmpty(mmid)) {
			PrintWriter out = response.getWriter();
			out.print("获取失败，没有传入mmid");
			out.flush();
			out.close();
		}

		if (StringUtil.isEmpty(num)) {
			PrintWriter out = response.getWriter();
			out.print("获取失败，没有传入num");
			out.flush();
			out.close();
		} else {
			int insertnum = Integer.parseInt(num) + 1;
			if (commonService.copyOneToPlayFile(ppid, mmid, insertnum)) {
				// 更新播表时间
				System.out.println("copy one to playFile !!!!!");
				List<Items> itemsList = materialDao.findByPtable(ppid);
				PlayTable playTable = ptableService.getPlayTableByPid(ppid); 
				int allTime = 0;
				String terminalId = "";
				if (itemsList.size() > 0) {
					terminalId = itemsList.get(0).getTerminalId();
				}
				//Set<Items> itemSet = new HashSet<Items>();
				for (Items items : itemsList) {
					// allTime = ∑item时长 * 播表基频
					allTime += items.getDuration() * playTable.getBaseFrequency();
				}
				String allTimeStr = allTime / 60 + "分";
				if (allTime % 60 == 0) {
					allTimeStr += allTime % 60 + "秒";
				}
				
				System.out.println(allTimeStr);
				Terminal terminal = terminalService.get(terminalId);
				double fullScreenRate = (double) allTime * 1000 / (terminal.getRunEndTime().getTime() - terminal.getRunStartTime().getTime());
				ptableService.updatePlayTableAllTime(ppid, allTimeStr, new DecimalFormat("#.##%").format(fullScreenRate));
				PrintWriter out = response.getWriter();
				out.print("true");
				out.flush();
				out.close();
			}
		}
	}

	// 7.15
	@RequestMapping(value = "/delOneFromPlayFile")
	public void delOneFromPlayFile(String ppid, HttpServletRequest request, HttpServletResponse response, String mmid,
			String num) throws IOException {
		if (StringUtil.isEmpty(ppid)) {
			PrintWriter out = response.getWriter();
			out.print("失败，没有传入ppid");
			out.flush();
			out.close();
		}
		if (StringUtil.isEmpty(mmid)) {
			PrintWriter out = response.getWriter();
			out.print("失败，没有传入mmid");
			out.flush();
			out.close();
		}

		if (StringUtil.isEmpty(num)) {
			PrintWriter out = response.getWriter();
			out.print("失败，没有传入num");
			out.flush();
			out.close();
		} else {
			int deltnum = Integer.parseInt(num) + 1;
			if (commonService.delOneFromPlayFile(ppid, mmid, deltnum)) {
				// 删除成功后，更新file表的序号
				List<Items> itemsList  = materialDao.findByPtable(ppid);// 获取播表id对应剩余的所有稿件item
			
				String sortNum = "";// 当前ppid所存在的所有稿件mid
				for (Items item:itemsList ) {
					sortNum += "," + item.getMaterial().getMid();
				}
				//判断sortNum是否为空
				if (!"".equals(sortNum)) {
					sortNum = sortNum.substring(1);
					ptableService.modifyPlayTableNumbyDelAll(ppid, sortNum);
				}
				
				
				//更新播表时间以及重设稿件是否排播
				
				//Set <Items> itemsSet = new HashSet<Items>(itemsList);
				PlayTable playTable = ptableService.getPlayTableByPid(ppid);
				
				//bug :  空指针异常！      
				//by bobo   2019/11/22
				//处理删除最后一个
				if (itemsList.size() == 0){
					ptableService.updatePlayTableAllTime(ppid, "0分0秒", new DecimalFormat("#.##%").format(0.00));
					PrintWriter out = response.getWriter();
					out.print("true");
					out.flush();
					out.close();
					return;
				}
				
				
				
				//这里是把当天这个节目彻底删除
				//bug :  无法添加删除后的稿件
				//by  bobo  2019/11/22
//				
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//				Date d1 = playTable.getPlayDate();
//				List<Items> list = materialDao.findItemsByMidBetweenDates(mmid, sdf.format(d1), sdf.format(d1));
//				//把这个items给删掉
//				for (Items item : list) {
//					item.setDeleted(1);
//					commonService.updateItem(item);
//				}
				
//				Material material = materialService.getById(mmid);
//				System.out.println("开始检测更新稿件排播信息！！！");
//				boolean hasWillBeDeletedMaterialFlag = false;
//				for (Items items : itemsList) {
//					if (items.getMaterial().getMid() == mmid){
//						//还有这个稿件的节目
//						hasWillBeDeletedMaterialFlag = true;
//						break; 
//					}
//				}
//				//没有这个mmid的稿件的节目了,更新一下信息
//				if (!hasWillBeDeletedMaterialFlag) {
//					System.out.println("更新稿件排播信息！！！");
//					//这里要把删除的那个item的deleted变成1
//					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//					Date d1 = playTable.getPlayDate();
//					List<Items> list = materialDao.findItemsByMidBetweenDates(mmid, sdf.format(d1), sdf.format(d1));
//					//其实就只有一个
//					for (Items item : list) {
//						item.setDeleted(1);
//						commonService.updateItem(item);
//					}
//				}

				itemsList  = materialDao.findByPtable(ppid);
				int allTime = 0;
				String terminalId = "";
				for (Items items : itemsList) {
					// allTime = ∑item时长 * 播表基频
					allTime += items.getDuration() * playTable.getBaseFrequency();
					
					if ("".equals(terminalId)) {
						terminalId = items.getTerminalId();
					}
				}
				String allTimeStr = allTime/60 + "分" + allTime%60 +"秒";
				System.out.println("播表总时长"+allTimeStr);
				Terminal terminal = terminalService.get(terminalId);
				double fullScreenRate = (double)allTime * 1000 / (terminal.getRunEndTime().getTime() - terminal.getRunStartTime().getTime());
				ptableService.updatePlayTableAllTime(ppid, allTimeStr, new DecimalFormat("#.##%").format(fullScreenRate));
				
				
				PrintWriter out = response.getWriter();
				out.print("true");
				out.flush();
				out.close();
			}
		}
	}

	// by bobo 2020/3/12
	// 更新不通过的理由
	@RequestMapping("/updateUnAccessReason")
	@ResponseBody
	public String updateUnAccessReason(String pid, String reason, HttpServletRequest request){
		System.out.println(pid + reason);
		ptableService.updateUnAccessReason(pid,reason);
		return "true";
	}


	private int fromListItems(String dateTime) {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = f.parse(f.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date d = null;
		try {
			d = f.parse(dateTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int width = (int) (((d.getTime() - date.getTime())) / 1000 / 60 / 60 / 24);
		return width;
	}

	@RequestMapping(value = "generateExcel")
	public void generateExcel(String terminalId, String startTime, String endTime, String statusId,
			HttpServletResponse response) throws ParseException {
		List<Terminal> list1 = commonService.getAllTerminal();
		List<Period> listPeriod = commonService.getAllPeriod();
		List<User> listUser = commonService.getAllUser();

		if (!"".equals(startTime) && !"".equals(endTime)) {
			Date d1 = TimeUtil.translateDate(startTime);
			Date d2 = TimeUtil.translateDate(endTime);
			if (!TimeUtil.dateValidate(d1, d2)) {
				PageResultData<PtableDto> pageResult1 = new PageResultData<PtableDto>();
				pageResult1.setCount(0);
				pageResult1.setFail(1);
				pageResult1.setCode(0);
				pageResult1.setMsg("时间前后有误!!");
			}
		}

		try {
			// 第一步，创建一个webbook，对应一个Excel文件
			HSSFWorkbook wb = new HSSFWorkbook();
			// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
			HSSFSheet sheet = wb.createSheet("表一");
			// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			HSSFRow row = sheet.createRow((int) 0);
			// 第四步，设置各列表头
			HSSFCell cell = row.createCell((short) 0);
			cell.setCellValue("播表名");

			cell = row.createCell((short) 1);
			cell.setCellValue("播放日期");

			cell = row.createCell((short) 2);
			cell.setCellValue("时段范围");

			cell = row.createCell((short) 3);
			cell.setCellValue("播表类型");

			cell = row.createCell((short) 4);
			cell.setCellValue("审核状态");

			cell = row.createCell((short) 5);
			cell.setCellValue("播表时长");

			cell = row.createCell((short) 6);
			cell.setCellValue("可播时长");

			cell = row.createCell((short) 7);
			cell.setCellValue("占屏比");

			cell = row.createCell((short) 8);
			cell.setCellValue("终端名");

			cell = row.createCell((short) 9);
			cell.setCellValue("创建人");

			cell = row.createCell((short) 10);
			cell.setCellValue("创建时间");

			// 第五步，写入实体数据 实际应用中这些数据从数据库得到，
			List<PlayTable> list2 = ptableService.findPlayTable(terminalId, startTime, endTime, statusId);
			List<PtableDto> list = EntityUtil.ptableDto(list1, listPeriod, listUser, list2);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow((int) i + 1);
				PtableDto pt = list.get(i);
				String getplaydate = sdf.format(pt.getPlayDate());
				String getcreatetime = sdf.format(pt.getCreateTime());

				row.createCell((short) 0).setCellValue(pt.getPtableName());

				row.createCell((short) 1).setCellValue(getplaydate);

				row.createCell((short) 2).setCellValue(pt.getPeriodTime());

				if (pt.getState() == 0) {
					row.createCell((short) 3).setCellValue("周期轮播");
				} else if (pt.getState() == 1) {
					row.createCell((short) 3).setCellValue("紧急插播");
				} else {
					row.createCell((short) 3).setCellValue("插播");
				}

				if (pt.getStatusId().equals("1")) {
					row.createCell((short) 4).setCellValue("未审核");
				} else if (pt.getStatusId().equals("2")) {
					row.createCell((short) 4).setCellValue("已初审");
				} else if (pt.getStatusId().equals("3")) {
					row.createCell((short) 4).setCellValue("已通过");
				} else {
					row.createCell((short) 4).setCellValue("未通过");
				}

				row.createCell((short) 5).setCellValue(pt.getPlayTotalTime());

				row.createCell((short) 6).setCellValue(pt.getAllTime());

				row.createCell((short) 7).setCellValue(pt.getScreenRate());

				row.createCell((short) 8).setCellValue(pt.getTerminalName());

				row.createCell((short) 9).setCellValue(pt.getCreateName());

				row.createCell((short) 10).setCellValue(getcreatetime);
			}

			// 第六步，将文件存到指定位置
			File file = new File(Constant.EXCELPATH);
			if (!file.exists()) {
				file.mkdirs();
			}
			String excelFileName = Constant.EXCELPATH + "/" + UUID.randomUUID().toString() + ".xls";
			FileOutputStream fout = new FileOutputStream(excelFileName);
			wb.write(fout);
			fout.close();

			new DownloadController().downloadFile(new File(excelFileName), response, true);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}



	@RequestMapping("/getPtableGroupAndMembers")
	@ResponseBody
	public List<PlayTable>  getPtableGroupAndMembers(@RequestParam String pid,@RequestParam int checkKind){

		return ptableService.getPtableGroupAndMembers(pid,checkKind);
	}




}
