package com.kewen.listener;

import com.kewen.model.Type;
import com.kewen.service.TypeService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.List;

@WebListener

public class ApplicationListener implements ServletContextListener, HttpSessionListener {
    private TypeService typeService = new TypeService();

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("服务器启动，监听ServletContext执行了....");
        List<Type> allType = typeService.getAllType();
        sce.getServletContext().setAttribute("typeList",allType);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {

    }
}
