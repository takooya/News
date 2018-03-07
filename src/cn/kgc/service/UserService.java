package cn.kgc.service;

import cn.kgc.pojo.UserBean;

public interface UserService {
    //根据用户名查找user
    UserBean getUserByName(String name);
}
