package cn.kgc.dao;

import cn.kgc.pojo.CategoryBean;
import cn.kgc.pojo.NewsBean;

import java.util.List;

public interface NewsDao {
    //返回全部新闻数据
    public List<NewsBean> queryAllNews();
    //根据Id查询新闻
    public NewsBean queryNewsById(NewsBean news);
    //根据id删除新闻
    public int deleteNewsById(NewsBean news);
    //添加新闻
    public int addNews(NewsBean news);
    //根据categoryId查询新闻个数,返回相应categoryId的个数
    public int countNewsByCategoryId(NewsBean news);
    public int countNewsByCategoryId(CategoryBean category);
    public int countNewsByCategoryId(int categoryId);
    //查询数据库中新闻总条数
    public int countAllNews();
    //根据当前页数获取新闻列表
    List<NewsBean> queryNewsByPage(int currentPage, int totalNewsInPage);
}
