package org.south.itms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.tool.schema.internal.exec.ScriptTargetOutputToFile;
import org.south.itms.dao.impl.CommonDao;
import org.south.itms.dao.impl.ResourceDao;
import org.south.itms.dao.impl.UserDao;
import org.south.itms.dto.Result;
import org.south.itms.entity.Resource;
import org.south.itms.entity.User;
import org.south.itms.mail.PtableSendingStateMail;
import org.south.itms.util.Constant;
import org.south.itms.util.StringUtil;
import org.south.itms.util.UserLoginListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import static org.south.itms.mail.PtableSendingStateMail.send;

/**
 * @author: yezilong
 */

@Controller  
@RequestMapping("/login")  
public class LoginController {
  
	  @Autowired
	  private UserDao userDao;
	  
	  @Autowired
	  private ResourceDao resourceDao;
	
	  @Autowired
	  private CommonDao commonDao;
	  
	  
	  @RequestMapping
	  @ResponseBody
	  public String loginPage() {
		  return "forward:/views/login.jsp";
		  //System.out.println("login=====");
		  //return new Result(false, "");
	  }
	  
	  @RequestMapping(value = "/checkTimeout")
	  @ResponseBody
	  public Result checkTimeout() {
		  return new Result(true, "");
	  }
	  
	  @RequestMapping(value = "/loginIn")
	  @ResponseBody
	  public Result loginIn(String userAccount, String userPassword, HttpSession session , HttpServletRequest request) throws Exception {

		  System.out.println(userAccount + "==" + userPassword);

		  if(StringUtil.isEmpty(userPassword) || StringUtil.isEmpty(userAccount)) {
			  return new Result("登录失败, 请输入用户名和密码");
		  }

		  User user = userDao.getUserByAccountAndPassword(userAccount, userPassword);
		  // 正确登录
	      if(user != null) {

			  // modify by bobo by 2020/4/11
			  // 远程登录模块

			  // 检查是否允许远程登录，不允许则看ip是否允许
			  if (!checkCanRemoteLogin(userAccount)){
				  System.out.println("该用户已经禁止远程登录，将查看是否是允许的ip");

				  // 看ip是否是允许的
				  if(!checkAllowIPValid(request)){
					  return new Result("登录失败，该用户不允许远程使用，请在办公室使用");
				  }
			  }

			  // modify by bobo 2020/3/5
	      	  // 达到限制后，就算正确也不能登录了
			  if (UserLoginListener.getSingleInstance().userLoginInfo.get(userAccount) != null ){
				  if (!UserLoginListener.getSingleInstance().userLoginInfo.get(userAccount).getCanLogin()){
					  return new Result("密码错误次数过多，当前账户被限制登录！");
				  }
			  }

	    	  Map<String, List<Resource>> map = userDao.getAllResource(user.getRole().getRoleId());
	    	  String webPath = this.getClass().getResource("/").getPath().replaceAll("%20", " ");
	    	  String path = webPath.substring(0, webPath.indexOf("WEB-INF"));
	    	  System.out.println(webPath);
	    	  System.out.println(path);
	    	  //user.setUserPassword("");
	    	  if(session.getAttribute("resourcesMap") != null || !"".equals(session.getAttribute("resourcesMap"))) {
	    		  session.removeAttribute("resourcesMap");
	    	  }
	    	  session.setAttribute("resourcesMap", map);
	    	  session.setAttribute("user", user);
	    	  session.setAttribute("userId", user.getUserId());
	    	  session.setAttribute("userName", user.getUserName());
	    	  session.setAttribute("roleName", user.getRole().getRoleName());
	    	  session.setAttribute("rId", user.getRole().getRoleId());
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 4) {
	    		  int num = userDao.getAccountRecord(1);
//	    		  System.out.println(num);
	    		  String n = "" + num;
	    		  session.setAttribute("checkNum", n);
	    		  
	    		  int num1 = userDao.getAccountTable(6);
	    		  int num2 = userDao.getAccountTable(7);
	    		  int nu = num1 + num2;
	    		  session.setAttribute("excepNum", "" + nu);
//	    		  System.out.println(session.getAttribute("checkNum"));
	    	  }
	    	  
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 5) {
	    		  int num = userDao.getAccountRecord(2);
	    		  System.out.println(num);
	    		  String n = "" + num;
	    		  session.setAttribute("checkNumSec", n);
	    	  }
	    	  
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 6) {
	    		  int num = userDao.getAccountTable(1);
	    		  System.out.println(num);
	    		  String n = "" + num;
	    		  session.setAttribute("playNum", n);
	    	  }
	    	  
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 7) {
	    		  int num = userDao.getAccountTable(2);
	    		  System.out.println(num);
	    		  String n = "" + num;
	    		  session.setAttribute("playNum", n);
	    	  }
	    	  
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 10) {
	    		  int num = userDao.getAccountTable(5);
	    		  int num1 = userDao.getAccountTable(7);
	    		  System.out.println(num);
	    		  int nu = num + num1;
	    		  String n = "" + nu;
	    		  session.setAttribute("broadNum", n);
	    	  }
	    	  
	    	  //加载该用户的权限
	    	  List<Resource> userResources = resourceDao.findByRole(user.getRole().getRoleId());
//	    	  for(Resource r : userResources) {
//	    		  System.out.println(r);
//	    	  }
	    	  session.setAttribute("userResources", userResources);
	    	  //每次登录移除以下属性, 该属性是该角色运行查看的地区
	    	  session.removeAttribute("allowAreaName");
	    	  return new Result(true, "");
	      }
	      // 错误登录
	      else {
	      	  // modify by bobo 2020/3/5
	      	  // 这里是用户名和密码错误的登录限制
			  // 会登记失败登录的用户名，加入名单，达到一定次数，将不能登录

			  // 当前尝试登录的账户名
			  String nowLoginUserAccount = userAccount;

			  // 登录记录者单例
			  UserLoginListener userLoginListener = UserLoginListener.getSingleInstance();

			  // 错误登录记录表
			  HashMap<String, UserLoginListener.UserInfo> userErrLoginInfo = userLoginListener.userLoginInfo;

			  // 更新当前账户的信息
			  userLoginListener.updateUserLoginInfo(nowLoginUserAccount);

			  int canTryLoginTimes = userLoginListener.getTodayLoginLimit() - userErrLoginInfo.get(nowLoginUserAccount).getTodayLoginTimes();
			  // 检查是否不能再登录
			  if ((!userErrLoginInfo.get(userAccount).getCanLogin()) || canTryLoginTimes == 0){
					return new Result("密码错误次数过多，当前账户被限制登录！");
			  }
			  // 返回还能登录的次数
	    	  return new Result("用户名或密码错误，当前账户还剩" + canTryLoginTimes + "次尝试机会");
	      }  
	  }


	  // 检测远程登录权限
	private boolean checkCanRemoteLogin(String userAccount) {

		User user = userDao.getUserByUserAccount(userAccount);

		System.out.println(userAccount+ "remoteSwitch: " + user.getRemoteSwitch());

		return (user.getRemoteSwitch() != 0);
	}


	// 允许的IP检测
	private boolean checkAllowIPValid(HttpServletRequest request) {

		System.out.println("X-Forwarded-For: " + request.getHeader("X-Forwarded-For"));
		System.out.println("X-Real-IP: " + request.getHeader("X-Real-IP"));
		System.out.println("Proxy-Client-IP: " + request.getHeader("Proxy-Client-IP"));
		System.out.println("WL-Proxy-Client-IP" + request.getHeader("WL-Proxy-Client-IP"));
		System.out.println("HTTP_CLIENT_IP: " + request.getHeader("HTTP_CLIENT_IP"));
		System.out.println("HTTP_X_FORWARDED_FOR: " + request.getHeader("HTTP_X_FORWARDED_FOR"));
		System.out.println("RemoteAddr: " + request.getRemoteAddr());

	  	// 获取源ip
	  	String ip = getSourceIP(request);

	  	System.out.println("source ip : " + ip);

	  	// 是否存在该允许ip
		return commonDao.getCountByIP(ip) > 0;
	}

	private String getSourceIP(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");


		if (!StringUtils.isEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个ip值，第一个ip才是真实ip
			int index = ip.indexOf(",");
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		}
		ip = request.getHeader("X-Real-IP");
		if (!StringUtils.isEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			return ip;
		}
		return request.getRemoteAddr();
	}



	@RequestMapping(value="/reqLogin", method=RequestMethod.POST)
	  public @ResponseBody Result reqLogin(User reqUser, HttpSession session) {
		  if(reqUser == null || StringUtil.isEmpty(reqUser.getUserAccount()) || StringUtil.isEmpty(reqUser.getUserPassword())) {
			  return new Result("登录失败, 请输入用户名和密码");
		  }

		  User user = userDao.getUserByAccountAndPassword(reqUser.getUserAccount(), reqUser.getUserPassword());
	      if(user != null) {
	    	  String webPath = this.getClass().getResource("/").getPath().replaceAll("%20", " ");
	    	  String path = webPath.substring(0, webPath.indexOf("WEB-INF"));
	    	  System.out.println(webPath);
	    	  System.out.println(path);
	    	  //user.setUserPassword("");
	    	  session.setAttribute("user", user);
	    	  session.setAttribute("userId", user.getUserId());
	    	  session.setAttribute("userName", user.getUserName());
	    	  session.setAttribute("roleName", user.getRole().getRoleName());
	    	  session.setAttribute("rId", user.getRole().getRoleId());
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 4) {
	    		  int num = userDao.getAccountRecord(1);
//	    		  System.out.println(num);
	    		  String n = "" + num;
	    		  session.setAttribute("checkNum", n);
	    		  
	    		  int num1 = userDao.getAccountTable(6);
	    		  int num2 = userDao.getAccountTable(7);
	    		  int nu = num1 + num2;
	    		  session.setAttribute("excepNum", "" + nu);
//	    		  System.out.println(session.getAttribute("checkNum"));
	    	  }
	    	  
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 5) {
	    		  int num = userDao.getAccountRecord(2);
	    		  System.out.println(num);
	    		  String n = "" + num;
	    		  session.setAttribute("checkNumSec", n);
	    	  }
	    	  
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 6) {
	    		  int num = userDao.getAccountTable(1);
	    		  System.out.println(num);
	    		  String n = "" + num;
	    		  session.setAttribute("playNum", n);
	    	  }
	    	  
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 7) {
	    		  int num = userDao.getAccountTable(2);
	    		  System.out.println(num);
	    		  String n = "" + num;
	    		  session.setAttribute("playNum", n);
	    	  }
	    	  
	    	  if(Integer.parseInt(user.getRole().getRoleId()) == 10) {
	    		  int num = userDao.getAccountTable(5);
	    		  int num1 = userDao.getAccountTable(7);
	    		  System.out.println(num);
	    		  int nu = num + num1;
	    		  String n = "" + nu;
	    		  session.setAttribute("broadNum", n);
	    	  }
	    	  
	    	  //加载该用户的权限
	    	  List<Resource> userResources = resourceDao.findByRole(user.getRole().getRoleId());
	    	  for(Resource r : userResources) {
	    		  System.out.println(r);
	    	  }
	    	  session.setAttribute("userResources", userResources);
	    	  //每次登录移除以下属性, 该属性是该角色运行查看的地区
	    	  session.removeAttribute("allowAreaName");
	    	  return new Result(true, "");
	      } else {  
	    	  return new Result("用户名或者密码不正确");
	      }  
	  }
	  
	  
	  @RequestMapping(value="/reqLogout")
	  @ResponseBody
	  public String reqLogout(HttpSession session) {
		   session.invalidate();  //是让当前浏览器的session销毁,也就是一个session被销毁，比如用户登录后注销就用这个，因为注销意味着该用户session中的所有属性均失效。
		   return "true";
	  }
	
}


