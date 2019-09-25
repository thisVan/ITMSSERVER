package org.south.itms.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;  
  
/**
 * @author: yezilong
 */

public class SpringContextHelper implements ApplicationContextAware {  
	
    private static ApplicationContext context = null;  
  
    @Override  
    public void setApplicationContext(ApplicationContext applicationContext)  
            throws BeansException {  
        context = applicationContext;  
    }  
      
    public static Object getBean(String name){  
        return context.getBean(name);  
    }  
      
}  