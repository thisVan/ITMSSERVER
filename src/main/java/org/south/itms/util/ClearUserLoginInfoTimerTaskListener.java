package org.south.itms.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


/**
 * @author bobo
 */
public class ClearUserLoginInfoTimerTaskListener implements  ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        new TimerManager();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // TODO Auto-generated method stub

    }

}

