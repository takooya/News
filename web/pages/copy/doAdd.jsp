<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.io.*,java.util.*,org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="cn.kgc.pojo.NewsBean" %>
<%@ page import="cn.kgc.service.impl.NewsServiceImpl" %>
<%@ page import="cn.kgc.service.NewsService" %>
<%@ page import="cn.kgc.util.Secret" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //接收增加的新闻信息，并调用后台方法，将新闻信息插入数据库
    request.setCharacterEncoding("utf-8");
    boolean bRet = false;
    boolean bUpload = false;
    String uploadFileName = "";
    String fieldName = "";
    NewsBean news = new NewsBean();
    news.setCreateDate(new Date());
    //解析请求之前先判断请求类型是否为文件上传类型
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    //指定上传位置
    //String uploadFilePath = request.getSession().getServletContext().getRealPath("upload/");
    String uploadFilePath="C:/Users/takoo/IdeaProjects/News/web/upload/";
    File saveDir = new File(uploadFilePath);
    //如果目录不存在，就创建目录
    if(!saveDir.exists()){
        saveDir.mkdir();
    }

    if(isMultipart){
        //创建文件上传核心类
        FileItemFactory factory = new DiskFileItemFactory(); // 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
        ServletFileUpload upload = new ServletFileUpload(factory); // 用以上工厂实例化上传组件
        try{
            //处理表单请求
            List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> iter = items.iterator();
            while(iter.hasNext()){
                FileItem item = (FileItem)iter.next();
                if(item.isFormField()){// 如果是普通表单控件
                    fieldName = item.getFieldName();// 获得该字段名称
                    switch (fieldName){
                        case "title":
                            news.setTitle(item.getString("UTF-8"));
                            break;
                        case "categoryId":
                            news.setCategoryId(Integer.parseInt(item.getString()));
                            break;
                        case "summary":
                            news.setSummary(item.getString("UTF-8"));
                            break;
                        case "myContent":
                            news.setContent(item.getString("UTF-8"));
                            break;
                        case "author":
                            news.setAuthor(item.getString("UTF-8"));
                            break;
                    }
                }else{// 如果为文件域
                    String fileName = Secret.toSecret(news.getTitle())+item.getName();// 获得文件名(全路径)
                    if(fileName != null && !fileName.equals("")){
                        File fullFile = new File(fileName);
                        File saveFile = new File(uploadFilePath,fullFile.getName());//将文件保存到指定的路径
                        item.write(saveFile);
                        uploadFileName = fullFile.getName();
                        news.setPicPath(uploadFileName);
                        bUpload = true;
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    System.out.println("上传成功之后的文件名：" + news.getPicPath());
    //调用后台的方法，将新闻信息插入数据库中
    NewsService newsService=new NewsServiceImpl();
    bRet = newsService.addNews(news)>0;
    if(bRet)
        response.sendRedirect("admin.jsp");
    else
        response.sendRedirect("admin.jsp");
%>
</body>
</html>
