package org.south.itms.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class ClearUserLoginInfoTimerTaskListener implements  ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        new TimerManager();
    }

    public void contextDestroyed(ServletContextEvent sce) {
        // TODO Auto-generated method stub

    }

}

