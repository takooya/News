<%@ page import="cn.kgc.service.CategoryService" %>
<%@ page import="cn.kgc.service.impl.CategoryServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.kgc.pojo.CategoryBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="categoryService" class="cn.kgc.service.impl.CategoryServiceImpl"></jsp:useBean>
<link type="text/css" rel="stylesheet" href="<%request.getContextPath();%>/css/common.css"/>
<div class="main-content-left">
    <!--新闻专题分类,普通用户界面-->
    <div class="class-box">
        <div class="class-box-header">
            <span class="fr"><a href="/pages/pageRight.jsp" target="rightFrame">更多...</a></span>
            <h3>新闻专题</h3>
        </div>
        <div class="class-box-content">
            <ul>
                <%
                    List<CategoryBean> list=categoryService.getCategoryListAll();
                    request.setAttribute("list",list);
                %>
                <c:forEach items="${list}" var="categoryInList" begin="1" end="6" varStatus="status">
                <li <c:if test="${status.count==6}">class="clear-bottom-line"</c:if>>
                    <a href="/pages/pageRight.jsp" target="rightFrame">${categoryInList.name}</a>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!--最新新闻-->
    <div class="left-box">
        <div class="left-box-tbg">
            <div class="left-box-bbg">
                <div class="left-box-header"><h3><a href="#" target="rightFrame">最新新闻</a></h3></div>
                <div class="left-box-content">
                    <ul>
                        <c:forEach var="x" begin="1" end="3">
                            <li><a href="/pages/pageRight.jsp" target="rightFrame">课工场最靠谱的互联网教育 Java Web从入门到成就！</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--最新评论-->
    <div class="left-box">
        <div class="left-box-tbg">
            <div class="left-box-bbg">
                <div class="left-box-header"><h3>最新评论</h3></div>
                <div class="left-box-content">
                    <ul>
                        <c:forEach var="x" begin="1" end="3">
                            <li><a href="/pages/pageRight.jsp"  target="rightFrame">课工场最靠谱的互联网教育 Java Web从入门到成就！</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>