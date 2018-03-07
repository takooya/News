<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="<%request.getContextPath();%>/css/common.css"/>
<jsp:useBean id="newsService" class="cn.kgc.service.impl.NewsServiceImpl"></jsp:useBean>
<div id="header">
    <div class="main-top">
        <iframe name="upFrame" style="WIDTH: 100%; HEIGHT: 100%" src="<%=request.getContextPath()%>/pages/common/mainTop.jsp" frameborder=0>
        </iframe>
    </div>
    <%--<div class="main-top">
        <div class="logo"><a href=""><span>新闻大视野</span></a></div>
            <div class="login-box">
                <form target="upFrame" id="loginFrm" name="loginFrm"
                      action="${pageContext.request.contextPath}/pages/common/errorPage.html" method="post">
                    <label>用户名</label><input type="text" name="uname" id="uname"/>
                    <label>密码</label><input type="text" name="upassword" id="upassword"/>
                    <input type="button" onclick="available();" value="登录"/>
                </form>
            </div>
        <div class="nav">
            <ul class="clearfix">
                <li><a href="${pageContext.request.contextPath}/index.jsp" target="_top">首页</a></li>
                <li><a href="#">国内</a></li>
                <li><a href="#">国际</a></li>
                <li><a href="#">娱乐</a></li>
                <li><a href="#">军事</a></li>
            </ul>
        </div>
    </div>--%>
    <!--banner-->
    <div class="main-banner">
        <img src="/images/banner.png"/>
    </div>
    <!--管理工具栏-->
    <%
        //三种情况
        //1,user为空,第一次访问,显示index.jsp
        //2,user为普通用户,显示index.jsp
        //3,user为管理员,显示admin.jsp
        //session.getAttribute("user");
    %>
    <div class="admin-bar"><span class="fr">退出账户</span>
        <a href="${pageContext.request.contextPath}/pages/admin/admin.jsp">管理员：admin 2012-06-19</a>
    </div>
    <!--搜索横框-->
    <div class="search-box">
        <div class="sl">
            <div class="sr clearfix">
                <span class="left-search clearfix">
                    <label>站内搜索</label><input type="text" name="keyword" value="关键词"/><button class="go-btn"></button>
                </span>
                <span class="right-link">
                    <label>快速链接</label><select><option>-----专题选择-----</option></select><button class="go-btn"></button>
                </span>
            </div>
        </div>
    </div>
</div>
