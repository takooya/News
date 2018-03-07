<%@page import="cn.kgc.pojo.NewsBean" %>
<%@page import="java.util.List" %>
<%@ page import="cn.kgc.util.Paging" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="newsService" class="cn.kgc.service.impl.NewsServiceImpl"/>
<jsp:useBean id="csImpl" class="cn.kgc.service.impl.CategoryServiceImpl"/>
<jsp:useBean id="myPage" class="cn.kgc.util.Paging"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>无标题文档</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"/>
    <style type="text/css">
        <!--

        -->
    </style>
    <script>
        function addNews() {
            window.location = "newsDetailCreateSimple.jsp";
        }

        function page_nav(frm, pageIndex) {
            document.forms['searchForm'], 2
            document.getElementById("currentPage");
        }
    </script>
</head>

<body>
<!--主体-->
<div class="main-content-right">
    <!--即时新闻-->
    <div class="main-text-box">
        <div class="main-text-box-tbg">
            <div class="main-text-box-bbg">
                <form name="searchForm" id="searchForm" action="/news/jsp/admin/newsDetailList.jsp" method="post">
                    <div>
                        新闻分类：
                        <%
                            //有对象newsService 属于NewsServiceImpl"/>
                            //有对象csImpl 属于CategoryServiceImpl" />
                            //设置每页显示新闻数
                            myPage.setTotalNewsInPage(3);
                            //设置当前页码
                            //第一次访问为空
                            //System.out.println("request-getParameter('currentPage'):"+request.getParameter("currentPage"));
                            //第一次访问为0
                            //System.out.println("myPage-getCurrentPage:"+myPage.getCurrentPage());
                            if (request.getParameter("currentPage") == null) {
                                myPage.setCurrentPage(1);
                            } else {
                                //System.out.println("in else request-getParameter('currentPage'):"+request.getParameter("currentPage"));
                                myPage.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
                            }
                            request.setAttribute("myPage", myPage);
                            //获得当页新闻列表
                            //System.out.println("myPage.getCurrentPage()"+myPage.getCurrentPage());
                            //System.out.println("myPage.getTotalNewsInPage()"+myPage.getTotalNewsInPage());
                            List<NewsBean> list = newsService.queryNewsByPage(myPage.getCurrentPage(), myPage.getTotalNewsInPage());
                            request.setAttribute("list", list);
                        %>
                        <%
                            request.setAttribute("categoryList", csImpl.getCategoryListAll());
                        %>
                        <select name="categoryId" id="categoryId">
                            <option value="0">全部</option>
                            <c:forEach var="bean" items="${categoryList}">
                                <option value=${bean.id}>${bean.name}</option>
                            </c:forEach>
                        </select>
                        新闻标题<input type="text" name="title" id="title" value=''/>
                        <button type="submit" class="page-btn">GO</button>
                        <button type="button" onclick="addNews();" class="page-btn">增加</button>
                        <input type="hidden" name="currentPage" id="currentPage" value="${myPage.currentPage}"/>
                        <input type="hidden" name="totalNewsInPage" id="totalNewsInPage"
                               value="${myPage.totalNewsInPage}"/>
                        <input type="hidden" name="totalPage" id="totalPage" value="${myPage.totalPage}"/>
                    </div>
                </form>
                <table cellpadding="1" cellspacing="1" class="admin-list">
                    <thead>
                    <tr class="admin-list-head">
                        <th>新闻标题</th>
                        <th>作者</th>
                        <th>时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="news" items="${list}" varStatus="status">
                        <tr <c:if test="${status.count%2==0}">class="admin-list-td-h2"</c:if>>
                            <td><a href='/pages/common/newsDetail.jsp?id=${news.id}'
                                   target="rightFrame">${news.title}</a></td>
                            <td>${news.author}</td>
                            <td>${news.createDate}</td>
                            <td><a href='/pages/common/updateNews.jsp?id=${news.id}' target="rightFrame">修改</a>
                                <a href="javascript:if(confirm('确认是否删除此新闻？')) location='adminNewsDel.jsp?id=${news.id}'"
                                   target="rightFrame">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="page-bar">
                    <ul class="page-num-ul clearfix">
                        <li>共${myPage.totalNews}条记录&nbsp;&nbsp; ${myPage.currentPage}/${myPage.totalPage}页</li>
                        <c:if test="${myPage.currentPage!=1}">
                            <a href="newsDetailList.jsp?currentPage=1" target="rightFrame">首页</a>
                            <a href="newsDetailList.jsp?currentPage=${myPage.currentPage-1}" target="rightFrame">上一页</a>
                        </c:if>
                        <c:if test="${myPage.currentPage!=myPage.totalPage}">
                            <a href="newsDetailList.jsp?currentPage=${myPage.currentPage+1}" target="rightFrame">下一页</a>
                            <a href="newsDetailList.jsp?currentPage=${myPage.totalPage}" target="rightFrame">最后一页</a>
                        </c:if>
                    </ul>
                    <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key"/>页
	     <button type="button" class="page-btn"
                 onClick='jump_to(document.searchForm,document.getElementById("inputPage").value)'>GO</button>
		</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>