package cn.kgc.dao.impl;

import cn.kgc.dao.Connect;
import cn.kgc.dao.UserDao;
import cn.kgc.pojo.UserBean;

import java.sql.SQLException;

public class UserDaoImpl extends Connect implements UserDao {

    @Override//根据用户名查找user
    public UserBean getUserByName(String name) {
        UserBean user=new UserBean();
        String sql="SELECT id,userName,password,email,userType FROM news_user WHERE userName=?";
        Object[] obj={name};
        query(sql,obj);
        int judge=0;
        try {
            while (rstSet.next()){
                user.setId(rstSet.getInt("id"));
                user.setUserName(rstSet.getString("userName"));
                user.setPassword(rstSet.getString("password"));
                user.setEmail(rstSet.getString("email"));
                user.setUserType(rstSet.getInt("userType"));
                judge++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            user=null;
        }finally {
            if(judge!=1){
                user=null;
                System.err.println("UserDaoImpl-getUserByName:userName is repetition in DB OR no user");
                judge=0;
            }
            closeResourse();
        }
        return user;
    }
}
