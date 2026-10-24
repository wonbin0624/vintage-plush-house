package com.kewen.service;
import com.kewen.dao.UserDao;
import com.kewen.model.User;
import com.kewen.utils.MD5Utils;

import java.sql.SQLException;

public class UserService {

    private UserDao dao = new UserDao();

    public void updatePwd(User user) {
        try {
            //密码加密  MD5加密
            String newPwd = MD5Utils.md5(user.getPassword());//先取出要更新的密码并加密
            user.setPassword(newPwd);//重新加加密的密码赋值带user
            dao.updateUserPwd(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateUserAddress(User user) {
        try {
            dao.updateUserAddress(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public User login(String ue) {
        User user = null;
        try {
            user = dao.selectByUsername(ue);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (user != null) {
            return user;
        }
        try {
            user = dao.selectByEmail(ue);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (user != null) {
            return user;
        }
        return null;

    }

    public boolean register(User user) {
        try {
            if (dao.isUsernameExist(user.getUsername())) {
                return false;
            }
            if (dao.isEmailExist(user.getEmail())) {
                return false;
            }
            String pwd = MD5Utils.md5(user.getPassword());
            user.setPassword(pwd);


            dao.addUser(user);
            return true;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    // 禁用用户
    public void disableUser(int userId) {
        try {
            dao.disableUser(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 检查用户是否被禁用
    public boolean isUserDisabled(int userId) {
        try {
            return dao.isUserDisabled(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



}
