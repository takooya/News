<%@ page import="java.util.List" %>
<%@ page import="com.jdbc.bean.Theme" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/29
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有主题</title>
</head>
<body>

<div>
    <form id="from1">
        <ul>
            <%
                List<Theme> list = (ArrayList<Theme>) request.getAttribute("ThemeList");
                for (int i = 0;i<list.size();i++) {
                    String name = list.get(i).gettName();
            %>
            <li><%=name%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="AlterTheme.jsp?id=<%=i%>>"  onclick="onclick1()">修改</a>&nbsp;&nbsp;&nbsp;
                <a href="AlterTheme.jsp?id=<%=i%>>"  onclick="onclick2()">删除</a>
                <input type="hidden" name="value" value="<%=name%>">
                <input type="hidden" name="flag" value="<%=i%>">
            </li>
            <%
                }
            %>
        </ul>
    </form>
</div>

</body>
<script>
    var from = document.getElementById("from1");
    function onclick1() {
        from.method="post" ;
        from.action="AlterTheme.jsp";
        from.submit();
    }
    function onclick2() {
        from.method="post" ;
        from.acction ="ShowTheme.jsp";
        from.submit();
    }
</script>
</html>
