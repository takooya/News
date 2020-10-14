package cn.kgc.web.servlet;

import cn.kgc.pojo.NewsBean;
import cn.kgc.service.NewsService;
import cn.kgc.service.impl.NewsServiceImpl;
import cn.kgc.util.Secret;
import com.mysql.jdbc.StringUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public class DoAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //接收增加的新闻信息，并调用后台方法，将新闻信息插入数据库
        //request.setCharacterEncoding("utf-8");
        boolean bRet = false;
        boolean bUpload = false;
        String uploadFileName = "";
        String fieldName = "";
        NewsBean news = new NewsBean();
        news.setCreateDate(new Date());
        //解析请求之前先判断请求类型是否为文件上传类型
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        //指定上传位置
        String uploadFilePath = request.getContextPath()+"/upload/";
        File saveDir = new File(uploadFilePath);
        //如果目录不存在，就创建目录
        if (!saveDir.exists()) {
            saveDir.mkdir();
        }

        if (isMultipart) {
            //创建文件上传核心类
            FileItemFactory factory = new DiskFileItemFactory(); // 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
            ServletFileUpload upload = new ServletFileUpload(factory); // 用以上工厂实例化上传组件
            try {
                //处理表单请求
                List<FileItem> items = upload.parseRequest(request);
                for (FileItem item : items) {
                    if (item.isFormField()) {// 如果是普通表单控件
                        fieldName = item.getFieldName();// 获得该字段名称
                        switch (fieldName) {
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
                            default:
                                throw new RuntimeException("错误的字段名称");
                        }
                    } else {// 如果为文件域
                        String fileName = Secret.toSecret(news.getTitle()) + item.getName();// 获得文件名(全路径)
                        if (!StringUtils.isNullOrEmpty(fileName)) {
                            File fullFile = new File(fileName);
                            File saveFile = new File(uploadFilePath, fullFile.getName());//将文件保存到指定的路径
                            item.write(saveFile);
                            uploadFileName = fullFile.getName();
                            news.setPicPath(uploadFileName);
                            bUpload = true;
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        System.out.println("上传成功之后的文件名：" + news.getPicPath());
        //调用后台的方法，将新闻信息插入数据库中
        NewsService newsService = new NewsServiceImpl();
        bRet = newsService.addNews(news) > 0;
        if (bRet)
            response.sendRedirect(request.getContextPath() + "/pages/admin/admin.jsp");
        else
            response.sendRedirect(request.getContextPath() + "/pages/commmon/addNewsError.jsp");
    }
}