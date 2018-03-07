package cn.kgc.service.impl;

import cn.kgc.dao.NewsDao;
import cn.kgc.dao.impl.NewsDaoImpl;
import cn.kgc.pojo.NewsBean;
import cn.kgc.service.NewsService;

import java.util.List;

public class NewsServiceImpl implements NewsService {
    private NewsDao newsDao;
    public NewsServiceImpl(){
        newsDao=new NewsDaoImpl();
    }
    @Override
    public List<NewsBean> queryAllNews() {
        return newsDao.queryAllNews();
    }

    @Override
    public NewsBean queryNewsById(NewsBean news) {
        return newsDao.queryNewsById(news);
    }

    @Override
    public int deleteNewsById(NewsBean news) {
        return newsDao.deleteNewsById(news);
    }

    @Override
    public int addNews(NewsBean news) {
        return newsDao.addNews(news);
    }

    @Override
    public int countAllNews() {
        return newsDao.countAllNews();
    }

    @Override
    public List<NewsBean> queryNewsByPage(int currentPage, int totalNewsInPage) {
        return newsDao.queryNewsByPage(currentPage,totalNewsInPage);
    }
}
