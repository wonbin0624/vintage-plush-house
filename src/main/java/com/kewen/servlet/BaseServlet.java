package com.kewen.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class BaseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //user？method=login
        //请求获取地址中的method的参数值
        String methodName=request.getParameter("method");
        if (methodName==null){
            //methodName如果是null，说明没有传递method参数
            //throw new RuntimeException("没有传递method参数");
            methodName="home";
        }
        //如果methodName有值，我们通过拿到方法名，利用java反射调用UserServlet中的方法
        Method method=null;
        try {
            method=this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        }
        try {
            method.invoke(this,request,response);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        }

    }
}
