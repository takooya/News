package cn.kgc.service;

import cn.kgc.pojo.NewsBean;

import java.util.List;

public interface NewsService {
    //返回全部新闻数据
    List<NewsBean> queryAllNews();

    //根据Id查询新闻
    NewsBean queryNewsById(NewsBean news);

    //根据id删除新闻
    int deleteNewsById(NewsBean news);

    //添加新闻
    int addNews(NewsBean news);

    //查询数据库中新闻总条数
    int countAllNews();

    //根据当前页数获取新闻列表
    List<NewsBean> queryNewsByPage(int currentPage, int totalNewsInPage);
}
