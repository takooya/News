<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("user");
    request.getRequestDispatcher(request.getContextPath()+"/pages/common/mainTop.jsp").forward(request,response);
%>
</body>
</html>
