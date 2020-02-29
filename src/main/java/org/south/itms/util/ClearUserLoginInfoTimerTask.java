package org.south.itms.util;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimerTask;

public class ClearUserLoginInfoTimerTask extends TimerTask {
    private static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Override
    public void run() {
        try {

            //清空哈希表
            UserLoginListener.getSingleInstance().clearUserLoginInfo();

            System.out.println("执行当前时间"+formatter.format(Calendar.getInstance().getTime()));
        } catch (Exception e) {
            System.out.println("-------------解析信息发生异常--------------");
        }
    }

}