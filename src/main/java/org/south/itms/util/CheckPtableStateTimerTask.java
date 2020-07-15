package org.south.itms.util;

import org.south.itms.mail.PtableSendingStateMail;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;

public class CheckPtableStateTimerTask extends TimerTask {

    private static SimpleDateFormat taskFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public void run() {
        try {
            // 预设变量
            String content = "<b>南方LED管理员您好!下面是来自播表传输自检模块的诊断报告:</b>";
            String senderNickname = "ITMS播表传输自检模块";
            String ITMSAdminEmailAddr = Constant.ITMSAdminEmailAddr;
            String subject = "播表传输自检结果报告";

            System.out.println(" CheckPtableState 执行当前时间"+taskFormatter.format(Calendar.getInstance().getTime()));

            // 获取今天的日期
            SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date(System.currentTimeMillis());
            SqlUpdate sqlUpdate = new SqlUpdate();
            ArrayList<CheckPtableSendingStateResult> checkPtableSendingStateResultList;

            // 用今天的日期去检查今日播表的发送状态
            checkPtableSendingStateResultList = sqlUpdate.getPtableSendingState(formatter.format(date));

            // 今天没有新增的
            if (checkPtableSendingStateResultList.size() == 0){
                return;
            }

            // 如果有问题则发送邮件
            int okCount = 0;
            int resultSize = checkPtableSendingStateResultList.size();
            System.out.println("接受到如下播表自检信息：");
            for (CheckPtableSendingStateResult c : checkPtableSendingStateResultList){
                c.toString();

                // 该播表正常传输
                if (c.getSendingState() == 1){
                    okCount++;
                    continue;
                }
                // 播表传输异常，发邮件通知管理员
                else {
                    String tempContent = "";
                    tempContent += "<p>" + c.getTerminalName() + "(TID: " + c.getTerminalId() + ") " + "播表: " + c.getPtableName() + "(PID:" + c.getPid() + ")</p >";
                    content += tempContent;
                }
            }
            content += "<br />";
            content += "<p>出现传输问题，请检查处理!</p >";
            content += "<hr />";
            content += "<p align = 'right'>" + formatter.format(new Date()) + "</p >";

            // 发送

            // 如果所有的播表正常传输，直接返回
            if (okCount == resultSize){
                return;
            }
            // 否则发送自检报告
            else {
                PtableSendingStateMail.send(senderNickname,subject,content,ITMSAdminEmailAddr);
            }
        } catch (Exception e) {
            System.out.println("-------------解析信息发生异常--------------");
        }
    }

}