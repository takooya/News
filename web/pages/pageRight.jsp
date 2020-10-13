<%@ page import="cn.kgc.pojo.NewsBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="<%request.getContextPath();%>/css/common.css"/>
<jsp:useBean id="newsService" class="cn.kgc.service.impl.NewsServiceImpl"></jsp:useBean>
<jsp:useBean id="myPage" class="cn.kgc.util.Paging"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="main-content-right">
    <!--各专题的新闻列表-->
    <div class="main-text-box">
        <div class="main-text-box-tbg">
            <div class="main-text-box-bbg">
                <div class="main-text-box-header">
                    <h3>即时新闻<%=request.getParameter("currentPage")%></h3>
                </div>
                <div class="main-text-box-content">
                    <%
                        //newsService为新闻对象
                        //myPage为页面显示新闻数对象
                    %>
                    <%
                    //List<NewsBean> list = newsService.queryAllNews();
                    if(request.getParameter("currentPage")==null){
                        myPage.setCurrentPage(1);
                    }else{
                        myPage.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
                    }
                    List<NewsBean> list = newsService.queryNewsByPage(myPage.getCurrentPage(),myPage.getTotalNewsInPage());
                    request.setAttribute("list",list);
                    request.setAttribute("myPage",myPage);
                    %>
                    <input type="hidden" name="currentPage" id="currentPage" value="${myPage.currentPage}"/>
                    <ul class="news-list-ul clearfix">
                        <c:forEach var="newsDetail" items="${list}" varStatus="status">
                            <li <c:if test="${status.count%5==0||status.count==fn:length(list)}">class='li-line'</c:if>>
                                <span>${newsDetail.createDate}</span>
                                <a href="/pages/common/newsDetail.jsp?id=${newsDetail.id}">${newsDetail.title}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!--图片新闻-->
                <div class="news-pic">
                    <dl>
                        <dt><img src="/images/new-1.png"/></dt>
                        <dd>PHP从入门到放弃</dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/new-2.png"/></dt>
                        <dd>Java Web从绝望到希望</dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/new-3.png"/></dt>
                        <dd>课工场五一回馈</dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/new-2.png"/></dt>
                        <dd>Java Web从绝望到希望</dd>
                    </dl>
                </div>
                <div class="page-bar">
                    <ul class="page-num-ul clearfix">
                        <li><a href="#">上一页</a>

                        <c:forEach begin="1" end="${myPage.totalPage}" varStatus="status">
                            <li>
                            <li><a target="_parent" href="/index.jsp?currentPage=${myPage.currentPage}"
                                   <c:if test="${status.count==1}">class="thisclass"</c:if>>${status.count}</a>
                        </c:forEach>
                        <li>
                        <li><a href="#">下一页</a>
                        <li>
                    </ul>
                    <span class="page-go-form"><label>跳转至</label><input type="text" name="numkey" class="page-key"/>页
                        <button type="submit" class="page-btn">GO</button>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <!--合作媒体-->
    <div class="main-text-box">
        <div class="main-text-box-tbg">
            <div class="main-text-box-bbg">
                <div class="main-text-box-header">
                    <h3>合作媒体</h3>
                </div>
                <div class="main-text-box-content">
                    <ul class="link-text-ul clearfix">
                        <c:forEach var="x" begin="1" end="7" step="1">
                            <li><a href="#">中国政府网</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
xuhao
1 name xiugai shanchu
2 name xiugai shanchu