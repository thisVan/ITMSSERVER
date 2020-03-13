package org.south.itms.aspect;

import javax.servlet.http.HttpSession;
import org.aspectj.lang.JoinPoint;
import org.south.itms.entity.PlayTable;
import org.south.itms.service.impl.PtableServiceImpl;
import org.south.netty.TableAutoGenerate;
import org.springframework.beans.factory.annotation.Autowired;

public class PlayTableOperationAspect {
    //稿件操作，被操作对象都是播表
    private final String OBJECT_TYPE = "PLAY_TABLE";

    //注入切面公共方法
    @Autowired
    private AspectCommonMethod aspectCommonMethod;

    @Autowired
    private PtableServiceImpl playTableServiceImpl;

    //播表生成切面
    public void completePlayTableGeneration(JoinPoint joinPoint){

        final String  currentOperation = "PLAY_TABLE_GENERATION";
        System.out.println("CompletePlayTableGeneration！");

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //异常处理
        if (!(boolean) session.getAttribute("completePlayTableGeneration")) {
            return;
        }

        session.setAttribute("completePlayTableGeneration", false);


        //获取被修改对象的信息
        for (String s : TableAutoGenerate.playTableAutoIdList) {
            PlayTable playTable = playTableServiceImpl.getPlayTableByPid(s);
            String modifyObjectName = playTable.getPtableName();
            String modifyObjectType = OBJECT_TYPE;
            String modifyObjectId = s;

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
        //每次读取完清空
        TableAutoGenerate.playTableAutoIdList.clear();
    }

    //在播表详情里面复制节目
    public void completePlayTableCopyItemInIt(JoinPoint joinPoint){

        final String  currentOperation = "PLAY_TABLE_COPY_ITEM";
        System.out.println("CompletePlayTableCopyItemInIt！");

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();
        //args  0--ppid 3--mmid 4--num
        //异常处理
        if (args[0] == null || args[3] == null || args[4]== null) {
            return;
        }

        //获取被修改对象的信息
        PlayTable playTable = playTableServiceImpl.getPlayTableByPid((String) args[0]);
        String modifyObjectName = playTable.getPtableName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId =  (String) args[0];

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

    //在播表详情里删除节目
    public void completePlayTableDeleteItemFromIt(JoinPoint joinPoint) {

        final String  currentOperation = "PLAY_TABLE_DELETE_ITEM";
        System.out.println("completePlayTableDeleteItemFromIt！");

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();
        //args  0--ppid 3--mmid 4--num
        //异常处理
        if (args[0] == null || args[3] == null || args[4]== null) {
            return;
        }


        //获取被修改对象的信息
        PlayTable playTable = playTableServiceImpl.getPlayTableByPid((String) args[0]);
        String modifyObjectName = playTable.getPtableName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId =  (String) args[0];

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

    //修改播表内节目的顺序
    public void completePlayTableChangePlayOrder(JoinPoint joinPoint){

        final String  currentOperation = "PLAY_TABLE_MODIFY_ORDER";
        System.out.println("completePlayTableModifyOrder");

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点
        Object[] args = joinPoint.getArgs();

        //获取被修改对象的信息
        PlayTable playTable = playTableServiceImpl.getPlayTableByPid((String) args[0]);
        String modifyObjectName = playTable.getPtableName();
        String modifyObjectType = OBJECT_TYPE;
        String modifyObjectId =  (String) args[0];

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

    //添加播表里的稿件
    //这个和节目增加时一样的

    //播表一级审核

    //审核通过记录
    public void completePlayTableFirstLevelReviewAccess(JoinPoint joinPoint){

        final String  currentOperation = "PLAY_TABLE_FIRST_LEVER_REVIEW_ACCESS";
        System.out.println("completePlayTableFirstLevelReview");

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();

        //播表列表
        String[] ptableIds = (String[]) args[0];

        //异常处理
        if (ptableIds.length == 0) {return;}

        //生成并保存用户日志
        for (String ptableId : ptableIds) {
            PlayTable playTable = playTableServiceImpl.getPlayTableByPid(ptableId);
            String modifyObjectName = playTable.getPtableName();
            String modifyObjectType = OBJECT_TYPE;
            String modifyObjectId = ptableId;

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

    //审核记录
    public void completePlayTableFirstLevelReviewUnAccess(JoinPoint joinPoint){

        final String  currentOperation = "PLAY_TABLE_FIRST_LEVER_REVIEW_UNACCESS";
        System.out.println("completePlayTableFirstLevelReview");

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();

        //播表列表
        String[] ptableIds = (String[]) args[0];

        //异常处理
        if (ptableIds.length == 0) {return;}

        //生成并保存用户日志
        for (String ptableId : ptableIds) {
            PlayTable playTable = playTableServiceImpl.getPlayTableByPid(ptableId);
            String modifyObjectName = playTable.getPtableName();
            String modifyObjectType = OBJECT_TYPE;
            String modifyObjectId = ptableId;

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

    //播表二级审核

    //审核通过记录
    public void completePlayTableFinalLevelReviewAccess(JoinPoint joinPoint){

        final String  currentOperation = "PLAY_TABLE_FINAL_LEVER_REVIEW_ACCESS";
        System.out.println("completePlayTableFinalLevelReview");

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();

        //播表列表
        String[] ptableIds = (String[]) args[0];

        //异常处理
        if (ptableIds.length == 0) {return;}

        //生成并保存用户日志
        for (String ptableId : ptableIds) {
            PlayTable playTable = playTableServiceImpl.getPlayTableByPid(ptableId);
            String modifyObjectName = playTable.getPtableName();
            String modifyObjectType = OBJECT_TYPE;
            String modifyObjectId = ptableId;

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


    //审核不通过记录
    public void completePlayTableFinalLevelReviewUnAccess(JoinPoint joinPoint){

        final String  currentOperation = "PLAY_TABLE_FINAL_LEVER_REVIEW_UNACCESS";
        System.out.println("completePlayTableFinalLevelReview");

        //获取用户Session
        HttpSession session = aspectCommonMethod.getNowSession();

        //获取连接点，提取信息
        Object[] args = joinPoint.getArgs();

        //播表列表
        String[] ptableIds = (String[]) args[0];

        //异常处理
        if (ptableIds.length == 0) {return;}

        //生成并保存用户日志
        for (String ptableId : ptableIds) {
            PlayTable playTable = playTableServiceImpl.getPlayTableByPid(ptableId);
            String modifyObjectName = playTable.getPtableName();
            String modifyObjectType = OBJECT_TYPE;
            String modifyObjectId = ptableId;

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
}
