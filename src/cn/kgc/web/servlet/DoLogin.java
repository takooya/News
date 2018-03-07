package cn.kgc.web.servlet;

import cn.kgc.pojo.UserBean;
import cn.kgc.service.UserService;
import cn.kgc.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DoLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname=req.getParameter("uname");
        String upassword=req.getParameter("upassword");
        System.out.println("DoLogin.doPost");
        System.out.print("\tuname:"+uname);
        System.out.print("\tupassword:"+upassword);
        UserService userService=new UserServiceImpl();
        UserBean user=new UserBean();
        user=userService.getUserByName(uname);
        if(user==null){
        //数据库中没有这个用户,或者其他问题
            System.out.println("DoLogin.doPost");
            System.out.print("\tuser"+user);
            req.getRequestDispatcher(req.getContextPath()+"/pages/common/mainTop.jsp").forward(req,resp);
            req.getSession().setAttribute("user",null);
        }else{
            if(!user.getPassword().equals(upassword)){
                //密码输入错误
                System.out.print("DoLogin.doPost");
                System.out.println("\tpassword is wrong");
                System.out.print("user.getPassword():"+user.getPassword());
                System.out.println("\tupassword:"+upassword);
                req.getRequestDispatcher(req.getContextPath()+"/pages/common/mainTop.jsp").forward(req,resp);
                req.getSession().setAttribute("user",null);
            }else{
                //将user放入session
                System.out.println("DoLogin.doPost"+user.toString());
                req.getSession().setAttribute("user",user);
                switch (user.getUserType()){
                    //管理员
                    case 0:
                        req.getRequestDispatcher(req.getContextPath()+"/pages/common/mainTop.jsp").forward(req,resp);
                        //resp.sendRedirect(req.getContextPath()+"/pages/admin/admin.jsp");
                        break;
                    //普通用户
                    case 1:
                        req.getRequestDispatcher(req.getContextPath()+"/pages/common/mainTop.jsp").forward(req,resp);
                        break;
                    default:
                        resp.sendRedirect(req.getContextPath()+"/index.jsp");
                }
            }
        }
    }
}
