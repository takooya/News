<link type="text/css" rel="stylesheet" href="<%request.getContextPath();%>/css/common.css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:jsp="http://java.sun.com/JSP/Page">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>无标题文档</title>
</head>
<body>
<form action="index.jsp" method="post">
    <!--页面顶部,静态包含-->
    <jsp:include page="/pages/common/pageTop.jsp"></jsp:include>
    <!--d页面主体-->
    <div id="content" class="main-content clearfix">
        <!--主体的的左边部分,动态包含--><%--<jsp:include page="pages/common/pageLeft.jsp"></jsp:include>--%>
        <div class="main-content-left">
            <iframe name="leftFrame" style="WIDTH: 100%; HEIGHT: 800px" src="/pages/common/pageLeft.jsp" frameborder=0>
            </iframe>
        </div>
        <!--页面主体的右部，包括新闻的列表和评论内容,动态包含 --><%--<jsp:include page="pages/pageRight.jsp"></jsp:include>--%>
        <div class="main-content-right">
            <iframe name="rightFrame" style="WIDTH: 100%; HEIGHT: 800px" src="/pages/pageRight.jsp" frameborder=0>
            </iframe>
        </div>
    </div>
    <!--页面底部,静态包含-->
    <jsp:include page="/pages/common/pageBottom.jsp"></jsp:include>
</form>
</body>
</html>