<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="cn.kgc.pojo.NewsBean" %>
<link type="text/css" rel="stylesheet" href="<%request.getContextPath();%>/css/common.css"/>
<jsp:useBean id="newsService" class="cn.kgc.service.impl.NewsServiceImpl"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--页面主体的右部，包括新闻的列表和评论内容 -->
<div class="main-content-right">
    <!--各专题的新闻列表-->
    <div class="main-text-box">
        <div class="article-place">
            <div class="my_self_set">
                <a href="#">新闻中心</a>:<a href="#">国内</a>
            </div>
        </div>
        <div class="main-text-box-tbg">
            <div class="main-text-box-bbg">
                <div class="article-box">
                    <%--动态显示新闻的代码区--%>
                    <%
                        if (request.getParameter("id") == null) {
                            System.out.println(this.getClass().getSimpleName() + "request.getParameter('id')==null");
                            response.sendRedirect("/pages/common/errorPage.html");
                            return;
                        }
                        int id = Integer.parseInt(request.getParameter("id"));
                        NewsBean news = newsService.queryNewsById(new NewsBean(id));
                        if (news == null) {
                            System.out.println(this.getClass().getSimpleName() + ":news is null");
                            response.sendRedirect("/pages/common/errorPage.html");
                            return;
                        }
                        request.setAttribute("news", news);
                    %>
                    <!--新闻的标题,新闻主体-->
                    <span>
                            <h1>${news.title}</h1>
                            <div class="source-bar">
                                发布者：${news.author} 分类：新闻信息 更新时间：${news.createDate}
                            </div>
                            <div class="article-content">
                                <span class="article-summary"><b>摘要：</b>${news.summary}</span>
                                <img src="/upload/${news.picPath}" onerror='this.src="/upload/error.png"'>
                                <p>${news.content}</P>
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
</div>
