package cn.kgc.web.filter;


import javax.servlet.*;
import java.io.IOException;

public class dealCodeToUtf8 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        req.setCharacterEncoding("utf-8");
        chain.doFilter(req,resp);
        resp.setCharacterEncoding("utf-8");
    }
    @Override
    public void destroy() {
    }
}
