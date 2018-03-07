package cn.kgc.service.impl;

import cn.kgc.dao.UserDao;
import cn.kgc.dao.impl.UserDaoImpl;
import cn.kgc.pojo.UserBean;
import cn.kgc.service.UserService;

public class UserServiceImpl implements UserService {
    UserDao userDao;

    public UserServiceImpl() {
        userDao=new UserDaoImpl();
    }

    @Override
    public UserBean getUserByName(String name) {
        return userDao.getUserByName(name);
    }
}
