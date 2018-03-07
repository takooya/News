<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="cn.kgc.pojo.NewsBean" %>
<link type="text/css" rel="stylesheet" href="<%request.getContextPath();%>/css/common.css"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<!--页面的头部-->
<div id="header">
    <!--页面顶部-->
    <%@include file="../common/pageTop.jsp" %>
    <!--页面的主体-->
    <div id="content" class="main-content clearfix">
        <!--主体的的左边部分-->
        <jsp:include page="../common/pageLeft.jsp"></jsp:include>
        <!--页面主体的右部，包括新闻的列表和评论内容 -->
        <div class="main-content-right">
            <!--各专题的新闻列表-->
            <div class="main-text-box">
                <div class="article-place">
                    <div class="my_self_set">
                        <a href="#">新闻中心</a><a href="#">国内</a>
                    </div>
                    </div>
                <div class="main-text-box-tbg">
                    <div class="main-text-box-bbg">
                        <div class="article-box">
                            <%--动态显示新闻的代码区--%>
                            <%
                                if(request.getParameter("id")==null){
                                    System.out.println(this.getClass().getSimpleName()+"request.getParameter('id')==null");
                                    response.sendRedirect("/pages/common/errorPage.html");
                                    return;
                                }
                                int id = Integer.parseInt(request.getParameter("id"));
                                NewsBean news = new NewsBean(id);
                                news = newsService.queryNewsById(news);
                                if (news == null) {
                                    System.out.println(this.getClass().getSimpleName()+":news is null");
                                    response.sendRedirect("/pages/common/errorPage.html");
                                    return;
                                }
                                String title = news.getTitle();
                                String author = news.getAuthor();
                                Date date = news.getCreateDate();
                                String time = new SimpleDateFormat("yyyy-MM-dd").format(date);
                                String summary = news.getSummary();
                                String content = news.getContent();
                            %>
                            <!--新闻的标题,新闻主体-->
                            <span>
                            <h1><%=title%></h1>
                            <div class="source-bar">
                                发布者：<%=author%> 分类：新闻信息 更新时间：<%=time %>
                            </div>
                            <div class="article-content">
                                <span class="article-summary"><b>摘要：</b><%=summary%></span>
                                <p><%=content%></P>
                            </div>
                            </span>
                            <!--评论信息区-->
                            <div class="comment">
                                <dl>
                                    <dt class="comment-top">
                                        <span class="fr">2011-09-25 13:33:55</span>
                                        <b>1楼</b> <b>水上漂</b>
                                    </dt>
                                    <dd class="comment-body">
                                        课工场，棒棒哒！
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="comment-top">
                                        <span class="fr">2011-09-25 13:33:55</span>
                                        <b>2楼</b> <b>拉娜</b>
                                    </dt>
                                    <dd class="comment-body">
                                        kgc,Fighting！
                                    </dd>
                                </dl>
                            </div>
                            <!--评论输入区-->
                            <div class="comment-form">
                                <div class="comment-form-header">
                                    <span>用户：Landodo</span>
                                    <h3>发表评论：</h3>
                                </div>
                                <div class="comment-form-content">
                                    <textarea class="comment-textarea"></textarea>
                                    <button type="submit" class="comment-btn">评论</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--//-->

        </div>
    </div>
    <!--页面底部-->
    <div class="main-footer-box">
        24小时客户服务热线：010-68988888 常见问题解答 新闻热线：010-627488888<br/>
        文明办网文明上网举报电话：010-627488888 举报邮箱：jubao@kgc.com.cn<br/>
        Coyright&copy;1999-2007 News China gov,All Right Reserved.<br/>
        新闻中心版权所有
    </div>
</div>
</body>
</html>