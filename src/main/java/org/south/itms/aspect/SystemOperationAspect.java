package org.south.itms.aspect;

import javax.servlet.http.HttpSession;
import org.aspectj.lang.JoinPoint;
import org.south.itms.entity.Role;
import org.south.itms.entity.Terminal;
import org.south.itms.entity.User;
import org.south.itms.service.impl.CommonService;
import org.south.itms.service.impl.TerminalService;
import org.springframework.beans.factory.annotation.Autowired;

public class SystemOperationAspect {

    //系统操作，被操作对象都是系统
    private final String OBJECT_TYPE = "SYSTEM";

    //注入切面公共方法
    @Autowired
    private AspectCommonMethod aspectCommonMethod;

    @Autowired
    private CommonService commonService;

    @Autowired
    private  TerminalService terminalService;


    public void completeSystemLogin(JoinPoint joinPoint){


//        //当前操作
//        final String  currentOperation = "SYSTEM_LOGIN";
//
//        //获取用户Session
//        HttpSession session = aspectCommonMethod.getNowSession();
//
//        String modifyObjectName = (String)session.getAttribute("userName");
//        String modifyObjectType = OBJECT_TYPE;
//        String modifyObjectId = "000";
//
//        //生成并保存
//        aspectCommonMethod.saveUserActionLog(
//                (String)session.getAttribute("userName"),
//                (String)session.getAttribute("roleName"),
//                aspectCommonMethod.getOperationTime(),
//                currentOperation,
//                modifyObjectName,
//                modifyObjectType,
//                modifyObjectId
//        );

    }


    public void completeAddUser(JoinPoint joinPoint){

        //当前操作
        final String  currentOperation = "SYSTEM_ADD_USER";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取新增的用户
        Object[] args = joinPoint.getArgs();
        User user = (User) args[0];

        String modifyObjectName = user.getUserName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = user.getUserId();

        //生成并保存
        aspectCommonMethod.saveUserActionLog(
                (String)session.getAttribute("userName"),
                (String)session.getAttribute("roleName"),
                aspectCommonMethod.getOperationTime(),
                currentOperation,
                modifyObjectName,
                modifyObjectType,
                modifyObjectId);
    }


    public void completeModifyUser(JoinPoint joinPoint){

        //当前操作
        final String  currentOperation = "SYSTEM_MODIFY_USER";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取新增的用户
        Object[] args = joinPoint.getArgs();
        User user = (User) args[0];

        String modifyObjectName = user.getUserName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = user.getUserId();

        //生成并保存
        aspectCommonMethod.saveUserActionLog(
                (String)session.getAttribute("userName"),
                (String)session.getAttribute("roleName"),
                aspectCommonMethod.getOperationTime(),
                currentOperation,
                modifyObjectName,
                modifyObjectType,
                modifyObjectId);
    }


    public void completeDeleteUser(JoinPoint joinPoint){

        final String  currentOperation = "SYSTEM_DELETE_USER";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();

        //播表列表
        String[] userIds = (String[]) args[0];

        //异常处理
        if (userIds.length == 0) {return;}

        //生成并保存用户日志
        for (String userId : userIds) {
            User user = commonService.getUserById(userId);
            String modifyObjectName = user.getUserName();
            String modifyObjectType = OBJECT_TYPE;
            String modifyObjectId = user.getUserId();

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

    public void completeAddRole(JoinPoint joinPoint){

        final String  currentOperation = "SYSTEM_ADD_ROLE";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();
        Role role = (Role) args[0];

        String modifyObjectName = role.getRoleName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = role.getRoleId();

        //生成并保存
        aspectCommonMethod.saveUserActionLog(
                (String)session.getAttribute("userName"),
                (String)session.getAttribute("roleName"),
                aspectCommonMethod.getOperationTime(),
                currentOperation,
                modifyObjectName,
                modifyObjectType,
                modifyObjectId);
    }

    public void completeModifyRole(JoinPoint joinPoint){

        final String  currentOperation = "SYSTEM_MODIFY_ROLE";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();
        Role role = (Role) args[0];

        String modifyObjectName = role.getRoleName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = role.getRoleId();

        //生成并保存
        aspectCommonMethod.saveUserActionLog(
                (String)session.getAttribute("userName"),
                (String)session.getAttribute("roleName"),
                aspectCommonMethod.getOperationTime(),
                currentOperation,
                modifyObjectName,
                modifyObjectType,
                modifyObjectId);
    }


    public void completeDeleteRole(JoinPoint joinPoint){

        final String  currentOperation = "SYSTEM_DELETE_ROLE";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();

        //播表列表
        String[] roleIds = (String[]) args[0];

        //异常处理
        if (roleIds.length == 0) {return;}

        //生成并保存用户日志
        for (String roleId : roleIds) {
            Role role = commonService.getRoleById(roleId);
            String modifyObjectName = role.getRoleName();
            String modifyObjectType = OBJECT_TYPE;
            String modifyObjectId = role.getRoleId();

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

    public void completeAddTerminal(JoinPoint joinPoint){
        final String  currentOperation = "SYSTEM_ADD_TERMINAL";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();
        Terminal terminal = (Terminal) args[0];

        String modifyObjectName = terminal.getTerminalName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = terminal.getTerminalId();

        //生成并保存
        aspectCommonMethod.saveUserActionLog(
                (String)session.getAttribute("userName"),
                (String)session.getAttribute("roleName"),
                aspectCommonMethod.getOperationTime(),
                currentOperation,
                modifyObjectName,
                modifyObjectType,
                modifyObjectId);
    }

    public void completeModifyTerminal(JoinPoint joinPoint){
        final String  currentOperation = "SYSTEM_MODIFY_TERMINAL";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();
        Terminal terminal = (Terminal) args[0];

        String modifyObjectName = terminal.getTerminalName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = terminal.getTerminalId();

        //生成并保存
        aspectCommonMethod.saveUserActionLog(
                (String)session.getAttribute("userName"),
                (String)session.getAttribute("roleName"),
                aspectCommonMethod.getOperationTime(),
                currentOperation,
                modifyObjectName,
                modifyObjectType,
                modifyObjectId);
    }

    public void completeDeleteTerminal(JoinPoint joinPoint){

        final String  currentOperation = "SYSTEM_DELETE_TERMINAL";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();

        //终端列表
        String[] terminalIds = (String[]) args[0];

        //异常处理
        if (terminalIds.length == 0) {return;}

        //生成并保存用户日志
        for (String terminalId : terminalIds) {
            Terminal terminal = terminalService.get(terminalId);
            String modifyObjectName = terminal.getTerminalName();
            String modifyObjectType = OBJECT_TYPE;
            String modifyObjectId = terminal.getTerminalId();

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

    public void completeStopTerminal(JoinPoint joinPoint){

        final String  currentOperation = "SYSTEM_STOP_TERMINAL";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();
        Terminal terminal = terminalService.get((String) args[0]);

        String modifyObjectName = terminal.getTerminalName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = terminal.getTerminalId();

        //生成并保存
        aspectCommonMethod.saveUserActionLog(
                (String)session.getAttribute("userName"),
                (String)session.getAttribute("roleName"),
                aspectCommonMethod.getOperationTime(),
                currentOperation,
                modifyObjectName,
                modifyObjectType,
                modifyObjectId);
    }

    public void completeRestartTerminal(JoinPoint joinPoint){

        final String  currentOperation = "SYSTEM_RESTART_TERMINAL";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();
        Terminal terminal = terminalService.get((String) args[0]);

        String modifyObjectName = terminal.getTerminalName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = terminal.getTerminalId();

        //生成并保存
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
