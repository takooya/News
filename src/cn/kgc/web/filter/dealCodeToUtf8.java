package cn.kgc.web.filter;


import javax.servlet.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class dealCodeToUtf8 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {

    }
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        req.setCharacterEncoding(StandardCharsets.UTF_8.name());
        chain.doFilter(req,resp);
        resp.setCharacterEncoding(StandardCharsets.UTF_8.name());
    }
    @Override
    public void destroy() {
    }
}
