package org.south.itms.aspect;

import org.aspectj.lang.JoinPoint;
import org.south.itms.entity.Marquee;
import org.south.itms.entity.Material;
import org.south.itms.entity.PlayTable;
import org.south.itms.service.impl.MarqueeService;
import org.south.itms.service.impl.MaterialService;
import org.south.itms.service.impl.PtableService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

public class ResetOperationAspect {

    @Autowired
    private AspectCommonMethod aspectCommonMethod;

    @Autowired
    private MaterialService materialService;

    @Autowired
    private PtableService ptableService;

    @Autowired
    private MarqueeService marqueeService;

    final String OBJECT_TYPE = "RESET";

    public void completeResetMaterial(JoinPoint joinPoint){

        final String currentOperation = "RESET_MATERIAL";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();
        
        Object[] args = joinPoint.getArgs();
        String mid = (String) args[0];

        Material material = materialService.getById(mid);
        String modifyObjectName = material.getMaterialName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = material.getMid();

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


    public void completeResetPtable(JoinPoint joinPoint){

        final String currentOperation = "RESET_PTABLE";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        Object[] args = joinPoint.getArgs();
        String pid = (String) args[0];

        PlayTable playTable = ptableService.getPlayTableByPid(pid);
        String modifyObjectName = playTable.getPtableName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = pid;

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


    public void completeResetMarquee(JoinPoint joinPoint){

        final String currentOperation = "RESET_MARQUEE";

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        Object[] args = joinPoint.getArgs();
        String mid = (String) args[0];

        Marquee marquee = marqueeService.getById(mid);
        String modifyObjectName = marquee.getMarqName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId = mid;

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
