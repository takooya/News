<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/29
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改主题</title>
    <style>
        #d1{
            color: red;
        }
        form{
            margin: 0px auto;
        }
    </style>
</head>
<body>
<div id="d1">
    <%
        request.setCharacterEncoding("utf-8");
        String massage = (String)request.getAttribute("massage");
        if (massage!=null){
            out.println(massage);
        }
    %>
</div>
<%
    String[] parameterValues = request.getParameterValues("value");
    String[] index = request.getParameterValues("flag");
    String name ="";
    for (String s : index){
        switch (s){
            case "0":
                 name =parameterValues[Integer.parseInt(s)];
                break;
            case "1":
                 name =parameterValues[Integer.parseInt(s)];
                break;
            case "2":
                name =parameterValues[Integer.parseInt(s)];
                break;
        }
    }
%>
<form method="post" action="ThemeController.jsp?opt=alt">
    <input type="text" name="newTheme" value="<%=name%>">
    <input type="hidden" name="oldTheme" value="<%=name%>">
    <input type="submit" value="提交"><input type="reset" value="重置">
</form>
</body>
</html>
