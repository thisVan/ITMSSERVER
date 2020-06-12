package org.south.itms.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class CheckPtableStateTimerTaskListener implements  ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        new CheckPtableStateTimerManager();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // TODO Auto-generated method stub

    }

}

