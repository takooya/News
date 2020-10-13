<%@ page import="cn.kgc.pojo.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="<%request.getContextPath();%>/css/common.css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>
    //判断用户名密码是否为空,如果均不为空,跳转
    function available() {
        var uname = document.getElementById("uname").value;
        var upassword = document.getElementById("upassword").value;
        var flag = true;
        if (uname == null || uname == undefined || uname == "" || uname == " ") {
            window.alert("请输入用户名");
            flag = false;
        }
        if (upassword == null || upassword == undefined || upassword == "" || upassword == " ") {
            window.alert("请输入密码");
            flag = false;
        }
        if (flag) {
            document.getElementById("loginFrm").submit();
        }
    }
</script>

<div class="main-top">
    <div class="logo"><a href=""><span>新闻大视野</span></a></div>
    <div class="login-box">

        <%
            UserBean user = (UserBean) session.getAttribute("user");
        %>
        <c:if test="${empty sessionScope.user}">
            <form target="upFrame" id="loginFrm" name="loginFrm"
                  action="${pageContext.request.contextPath}/servlet/doLogin" method="post">
                <label>用户名</label><input type="text" name="uname" id="uname"/>
                <label>密码</label><input type="password" name="upassword" id="upassword"/>
                <input type="button" onclick="available();" value="登录"/>
            </form>
        </c:if>
        <c:if test="${not empty sessionScope.user}">
            <h1 style="display:inline;">欢迎你${sessionScope.user.userName}</h1>
            <a href="${pageContext.request.contextPath}/pages/common/logout.jsp" style="float: right">注销登录</a>
        </c:if>
    </div>
    <div class="nav">
        <ul class="clearfix">
            <li><a href="/index.jsp" target="_top">首页</a></li>
            <li><a href="#">国内</a></li>
            <li><a href="#">国际</a></li>
            <li><a href="#">娱乐</a></li>
            <li><a href="#">军事</a></li>
        </ul>
    </div>
</div>