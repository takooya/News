package cn.kgc.dao;

import cn.kgc.pojo.UserBean;

public interface UserDao {
    //根据用户名查找user
    UserBean getUserByName(String name);
}
