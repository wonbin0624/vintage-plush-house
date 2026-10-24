package com.kewen.dao;

import com.kewen.model.User;
import com.kewen.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;

public class UserDao {
    public void updateUserPwd(User user) throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "UPDATE `user` set `password`=? WHERE id = ?";
        r.update(sql, user.getPassword(), user.getId());
    }
    public void updateUserAddress(User user) throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "UPDATE `user` SET `name`=?,phone=?,address=? WHERE id = ?";
        r.update(sql,user.getName(),
                user.getPhone(),
                user.getAddress(),
                user.getId());
    }
    public User selectByUsername(String username) throws SQLException{
        QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT * FROM `user` WHERE username = ?";
        return r.query(sql,new BeanHandler<User>(User.class),username);
    }
    public User selectByEmail(String email) throws SQLException{
        QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT * FROM `user` WHERE email = ?";
        return r.query(sql,new BeanHandler<User>(User.class),email);
    }

    public void addUser(User user) throws SQLException {
        String sql="INSERT INTO `user` (username,email,`password`,`name`,phone,address,isadmin,isvalidate) VALUES (?,?,?,?,?,?,?,?)";
        //QueryRunner r=new QueryRunner(数据源 DateSource);
        QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
        r.update(sql,user.getUsername(),
                user.getEmail(),
                user.getPassword(),
                user.getName(),
                user.getPhone(),
                user.getAddress(),
                user.isIsadmin(),
                user.isIsvalidate()
        );
    }

    //查询用户名是否存在
    public  boolean isUsernameExist(String username) throws SQLException{
        QueryRunner r=new QueryRunner(DataSourceUtils .getDataSource());
        String sql="SELECT *FROM `user` WHERE username= ?";//查询用户名是否存在的sql语句
        User u = r.query(sql,new BeanHandler<User>(User.class),username);
        if (u==null){
            return false;
        }else{
            return true;
        }
    }
    //查询邮箱是否存在
    public boolean isEmailExist(String email) throws SQLException {
        QueryRunner r=new QueryRunner(DataSourceUtils .getDataSource());
        String sql="SELECT *FROM `user` WHERE email= ?";//查询用户名是否存在的sql语句
        User u = r.query(sql,new BeanHandler<User>(User.class),email);
        if (u==null){
            return false;
        }else{
            return true;
        }
    }




    // 禁用用户账户
    public void disableUser(int userId) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "UPDATE `user` SET isvalidate = 1 WHERE id = ?";
        r.update(sql, userId);
    }

    // 检查用户是否被禁用
    public boolean isUserDisabled(int userId) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT isvalidate FROM `user` WHERE id = ?";
        Boolean result = r.query(sql, new ScalarHandler<Boolean>(), userId);
        return result != null && result;
    }


    public static void main(String[] args){

       /* User user=new User();
        user.setUsername("kewen");
        user.setPassword("145");
        user.setEmail("123@qq.com");
        user.setName("zhangsan");
        user.setPhone("1245236794");
        user.setAddress("sghjnb");
        UserDao userDao=new UserDao();
        try {
            userDao.addUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        */

       /* UserDao dao=new UserDao();
        try {
            System.out.println(dao.isEmailExist("123@qq.com"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            System.out.println(dao.isUsernameExist("kewen"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // System.out.println("测试用户数据录入成功!");
*/
    }

}
