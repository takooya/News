package cn.kgc.util;

import cn.kgc.dao.CategoryDao;
import cn.kgc.dao.impl.CategoryDaoImpl;
import cn.kgc.pojo.CategoryBean;
import cn.kgc.pojo.NewsBean;
import cn.kgc.service.CategoryService;
import cn.kgc.service.NewsService;
import cn.kgc.service.impl.CategoryServiceImpl;
import cn.kgc.service.impl.NewsServiceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class test {


    public static void main(String[] args) {
        //工具类
        NewsService nsi=new NewsServiceImpl();
        CategoryService categoryService=new CategoryServiceImpl();
        CategoryDao categoryDao=new CategoryDaoImpl();
        //实体类
        NewsBean nb=new NewsBean();
        CategoryBean categoryBean=new CategoryBean(11,"myTest");
        //显示新闻分类
        List<CategoryBean> list=categoryDao.getCategoryListAll();
        for (CategoryBean bean:list){
            System.out.println(bean.toString());
        }
        //添加新闻分类
        /*categoryService.addCategory(categoryBean);*/
        //删除新闻分类
        /*categoryService.deleteCategoryById(categoryBean);*/
        //查询新闻
        /*nb.setId(156);
        nsi.queryNewsById(nb);*/
        //添加新闻
        /*nb=new NewsBean();
        nb.setCategoryId(3);
        nb.setTitle("IDEA is not gnood");
        nb.setSummary("IDEA@yahoo.com");
        nb.setContent("什么都没有新闻内容呗");
        nb.setAuthor("test");
        nb.setCreateDate(new Date());
        nsi.addNews(nb);*/
    }
}
