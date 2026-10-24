package com.kewen.servlet;

import com.kewen.model.User;
import com.kewen.service.UserService;
import com.kewen.utils.MD5Utils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.rmi.RemoteException;

@WebServlet(urlPatterns = "/user")

public class UserServlet extends BaseServlet {
    private UserService service = new UserService();
    public void logout(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.getSession().removeAttribute("user");
        response.sendRedirect("/index.jsp");
    }
    public void changePwd(HttpServletRequest request,HttpServletResponse response) throws Exception{
        // 1. 获取表单提交的密码信息
        String password = request.getParameter("password");
        String newPwd = request.getParameter("newPassword");
        String confirmPwd = request.getParameter("confirmPwd");

        // 2. 获取当前会话，检查用户是否已登录
        HttpSession session = request.getSession();

        // 用户未登录，重定向到登录页面
        if(session.getAttribute("user")==null){
            request.getRequestDispatcher("/user_login.jsp").forward(request,response);
        }else{

            // 用户已登录，获取用户信息
            User loginUser = (User) session.getAttribute("user");

            // 3. 验证两次输入的新密码是否一致
            if (!newPwd.equals(confirmPwd)){
                request.setAttribute("error","修改失败，两次输入的新密码不一致！");
                request.getRequestDispatcher("/user_center.jsp").forward(request,response);
                return;//确保后续代码不执行
            }

            // 4. 验证原密码是否正确
            if(loginUser.getPassword().equals( MD5Utils.md5(password))){
                loginUser.setPassword(newPwd);
                service.updatePwd(loginUser);
                request.setAttribute("msg","密码修改成功!");
                // 提示成功信息并返回个人中心
                request.getRequestDispatcher("/user_center.jsp").forward(request,response);
            }else{

                // 原密码错误，提示用户
                request.setAttribute("error","修改失败，原密码不正确，请重新输入!");
                request.getRequestDispatcher("/user_center.jsp").forward(request,response);
            }
        }
    }
    public void changeAddress(HttpServletRequest request,HttpServletResponse response) throws Exception{
        HttpSession session = request.getSession();
        if (session.getAttribute("user")==null){
            request.getRequestDispatcher("/user_login.jsp").forward(request,response);
        }else {

            User loginUser = (User) request.getSession().getAttribute("user");
            BeanUtils.copyProperties(loginUser, request.getParameterMap());
            service.updateUserAddress(loginUser);
            request.setAttribute("msg", "收件信息更新成功");
            request.getRequestDispatcher("/user_center.jsp").forward(request, response);
        }
    }
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ue = request.getParameter("ue");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        User user = service.login(ue);
        if (user == null) {
            request.setAttribute("error", "用户名或邮箱地址不存在");
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
            return;
        }

        // 检查用户是否被禁用
        if (service.isUserDisabled(user.getId())) {
            request.setAttribute("error", "账户已被禁用，请联系管理员");
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
            return;
        }

        // 验证密码
        if (user.getPassword().equals(MD5Utils.md5(password))) {
            // 密码正确，清除错误次数记录
            session.removeAttribute("loginErrorCount_" + user.getId());
            session.setAttribute("user", user);
            request.getRequestDispatcher("/user_center.jsp").forward(request, response);
        } else {
            // 密码错误，记录错误次数
            String errorCountKey = "loginErrorCount_" + user.getId();
            Integer errorCount = (Integer) session.getAttribute(errorCountKey);
            if (errorCount == null) {
                errorCount = 0;
            }
            errorCount++;
            session.setAttribute(errorCountKey, errorCount);

            if (errorCount >= 3) {
                // 错误次数达到3次，禁用用户
                service.disableUser(user.getId());
                session.removeAttribute(errorCountKey); // 清除错误次数记录
                request.setAttribute("error", "密码错误次数过多，账户已被禁用，请联系管理员");
            } else {
                request.setAttribute("error", "密码不正确，还可以尝试 " + (3 - errorCount) + " 次");
            }
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
        }
    }

    public void register(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = new User();
        try {
            BeanUtils.copyProperties(user, request.getParameterMap());
            if (service.register(user)) {
                System.out.println("成功");
                request.setAttribute("msg", "注册成功,请登录");
                request.getRequestDispatcher("/user_login.jsp").forward(request, response);
            } else {
                System.out.println("失败");
                request.setAttribute("msg", "用户名和邮箱重复，请重新注册！");
                request.getRequestDispatcher("/user_register.jsp").forward(request, response);
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }
}

