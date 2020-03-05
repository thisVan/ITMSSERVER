package org.south.itms.util;

import java.util.HashMap;

//by bobo 2020/2/14
//用户登录的监听器
//用于限制用户每天的登录次数，防止暴力破解
//单例模式

public class UserLoginListener {

    //当日错误登录次数限制
    private final int  TODAYLOGINLIMIT = 5;

    private static UserLoginListener instance = new UserLoginListener();
    //私有化构造函数,单例模式
    private UserLoginListener(){};

    public static UserLoginListener getSingleInstance(){
        return instance;
    }

    public class UserInfo{
        String userAccount;
        String loginIPAddr;
        int todayLoginTimes;
        boolean canLogin;

        public boolean getCanLogin(){
            return canLogin;
        }
        public int getTodayLoginTimes() { return todayLoginTimes;}

        UserInfo(String userAccount, String loginIPAddr, int todayLoginTimes, boolean canLogin){
            this.userAccount =userAccount;
            this.loginIPAddr = loginIPAddr;
            this.todayLoginTimes = todayLoginTimes;
            this.canLogin = canLogin;
        }

    }

    //用户登录信息，账号 与 用户信息 的键值对
    public  HashMap<String,UserInfo> userLoginInfo = new HashMap<>();

    //新登录一个，更新登录信息哈希表
    //这个要在登录控制器里面调用
    public void updateUserLoginInfo(String userAccount) {

        //当天第一次登录
        if (!userLoginInfo.containsKey(userAccount)){
            userLoginInfo.put(userAccount,
                    new UserInfo(
                            userAccount,
                            "",
                            1,
                            true
                    ));
        }
        //非第一次登录
        else{
            //增加一次登录次数
            userLoginInfo.get(userAccount).todayLoginTimes++;
            //当日超出登录次数了
            if (isOverstepLoginTimes(userAccount)){
                // 超过登录次数置flag为false
                userLoginInfo.get(userAccount).canLogin = false;
            }
        }
    }

    public boolean isOverstepLoginTimes(String userAccount) {
        return userLoginInfo.get(userAccount).todayLoginTimes >= TODAYLOGINLIMIT;
    }


    //凌晨5点清空用户登录信息，定时任务
    public void clearUserLoginInfo(){
        userLoginInfo.clear();
        System.out.println("清理完毕");
    }

    public int getTodayLoginLimit(){return TODAYLOGINLIMIT;}

    public HashMap<String,UserInfo> getUserLoginInfo(){ return userLoginInfo;}
}
