package cn.kgc.web.filter;


import cn.kgc.pojo.UserBean;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class adminVisit implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)resp;
        HttpSession session = ((HttpServletRequest) req).getSession();
        UserBean user=(UserBean) session.getAttribute("user");
        if (user==null){
            //第一次访问
            System.out.println("adminVisit:user==null");
            response.sendRedirect("/pages/common/error.jsp");
        }else{
            switch (user.getUserType()){
                case 0:
                    //管理员,不能正常的显示pageTop
                    System.out.println("adminVisit.doFilter-case0");
                    System.out.println("req = [" + req + "], resp = [" + resp + "], chain = [" + chain + "]");
                    chain.doFilter(req,resp);
                    //response.sendRedirect("/pages/common/pageTop.jsp");
                    break;
                case 1:
                    //普通用户
                    System.out.println("adminVisit.doFilter-case1");
                    response.sendRedirect("/pages/common/error.jsp");
                    break;
                default:
                    System.out.println("adminVisit.doFilter-default");
                    System.out.println("adminVisit:userType have problem!");
                    response.sendRedirect("/pages/common/error.jsp");
            }
        }

    }
    @Override
    public void destroy() {
    }
}
