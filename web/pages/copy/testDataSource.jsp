<%@page import="cn.kgc.dao.NewsDao" %>
<%@page import="cn.kgc.dao.impl.NewsDaoImpl" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="cn.kgc.pojo.NewsBean" %>
<%@ page import="java.io.File" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'testDataSource.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<%
    //测试数据源配置是否成功，获取新闻数据
  	/*NewsDao dao = new NewsDaoImpl();
  	dao.queryNewsById(new NewsBean(1)).toString();*/
    //获取物理地址并输出

    //第一步：使用 内置对象 request 获取当前页面的虚拟路径，并剔除“/” 符号
    String webDir = request.getContextPath();
    if (webDir.length() > 0) {
        System.out.println(webDir);
        webDir = webDir.substring(1);
        System.out.println(webDir);
    } else {
        System.out.println(this.getClass().getSimpleName() + ":webDir.length() < 0");
    }
    //第二步: 使用Application 内置对象获取真实路径
    String realPath = request.getSession().getServletContext().getRealPath(webDir);
    System.out.println(realPath);
    //第三步: 使用java File 对象剔除文件名称，即可获取真实的目录
    String realDir = new File(realPath).getParent();
    System.out.println(realDir);
%>
</body>
</html>
