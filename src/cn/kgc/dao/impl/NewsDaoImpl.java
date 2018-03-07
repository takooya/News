package cn.kgc.dao.impl;

import cn.kgc.dao.Connect;
import cn.kgc.dao.NewsDao;
import cn.kgc.pojo.CategoryBean;
import cn.kgc.pojo.NewsBean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDaoImpl extends Connect implements NewsDao {
    //从queryAllNews和queryNewsByPage提取出的重复代码
    private List<NewsBean> resultSetToList(List<NewsBean> list) {
        try {
            while (rstSet.next()) {
                NewsBean news = new NewsBean();
                news.setId(rstSet.getInt("id"));
                news.setCategoryId(rstSet.getInt("categoryId"));
                news.setTitle(rstSet.getString("title"));
                news.setSummary(rstSet.getString("summary"));
                news.setContent(rstSet.getString("content"));
                news.setAuthor(rstSet.getString("author"));
                news.setCreateDate(rstSet.getDate("createDate"));
                list.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            list = null;
        } finally {
            closeResourse();
        }
        return list;
    }

    @Override//返回全部新闻数据
    public List<NewsBean> queryAllNews() {
        List<NewsBean> list = new ArrayList<>();
        String sql = "SELECT id,categoryId,title,summary,content,author,createDate FROM news_detail";
        Object obj[] = {};
        rstSet = query(sql, obj);
        list = resultSetToList(list);
        return list;
    }

    @Override//返回指定页码的新闻数据
    public List<NewsBean> queryNewsByPage(int currentPage, int totalNewsInPage) {
        List<NewsBean> list = new ArrayList<>();
        String sql = "SELECT id,categoryId,title,summary,content,author,createDate FROM news_detail ORDER BY id LIMIT ?,?";
        Object obj[] = {(currentPage - 1) * totalNewsInPage, totalNewsInPage};
        rstSet = query(sql, obj);
        list = resultSetToList(list);
        return list;
    }

    @Override
    public int countNewsByCategoryId(NewsBean news) {
        return countNewsByCategoryId(news.getCategoryId());
    }

    @Override
    public int countNewsByCategoryId(CategoryBean category) {
        return countNewsByCategoryId(category.getId());
    }

    @Override
    public int countNewsByCategoryId(int categoryId) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(1) FROM news_detail WHERE categoryId=?";
            Object obj[] = {categoryId};
            rstSet = query(sql, obj);
            int judge = 0;
            while (rstSet.next()) {
                count = rstSet.getInt(1);
                System.out.println(this.getClass().getSimpleName() + "获得查询分类的新闻条数为:" + count);
                judge++;
            }
            if (judge != 1) {
                System.err.println("NewsDaoImpl-countNewsByCategoryId:The count more than one result!");
                count = 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            count = 0;
        } finally {
            closeResourse();
        }
        return count;
    }

    @Override
    public int countAllNews() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(1) FROM news_detail";
            Object obj[] = {};
            rstSet = query(sql, obj);
            while (rstSet.next()) {
                count = rstSet.getInt(1);
                //System.out.println("NewsDaoImpl.countAllNews");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResourse();
        }
        return count;
    }

    @Override
    public NewsBean queryNewsById(NewsBean news) {
        NewsBean myNews = new NewsBean();
        try {
            String sql = "SELECT id,categoryId,title,summary,content,picPath,author,createDate FROM news_detail WHERE id=?";
            Object[] obj = {news.getId()};
            rstSet = query(sql, obj);
            int check = 0;
            while (rstSet.next()) {
                if (check != 0) {
                    System.out.println("NewsDaoImpl-queryNewsById:more than one same id");
                }
                myNews.setId(rstSet.getInt("id"));
                myNews.setCategoryId(rstSet.getInt("categoryId"));
                myNews.setTitle(rstSet.getString("title"));
                myNews.setSummary(rstSet.getString("summary"));
                myNews.setContent(rstSet.getString("content"));
                myNews.setPicPath(rstSet.getString("picPath"));
                myNews.setAuthor(rstSet.getString("author"));
                myNews.setCreateDate(rstSet.getDate("createDate"));
                check++;
            }
            if (check == 0) myNews = null;
        } catch (SQLException e) {
            e.printStackTrace();
            myNews = null;
        } finally {
            closeResourse();
        }
        return myNews;
    }

    @Override
    public int deleteNewsById(NewsBean news) {
        int rows;
        String sql = "DELETE FROM news_detail WHERE id=?";
        Object[] obj = {news.getId()};
        rows = update(sql, obj);
        closeResourse();
        if (rows == 0) {
            System.out.println("数据删除失败!");
        }
        return rows;
    }

    @Override
    public int addNews(NewsBean news) {
        int rows;
        String sql = "INSERT INTO news_detail(categoryId,title,summary,content,author,picPath,createDate) VALUES(?,?,?,?,?,?,?)";
        Object[] obj = {news.getCategoryId(), news.getTitle(), news.getSummary(), news.getContent(), news.getAuthor(), news.getPicPath(), news.getCreateDate()};
        rows = update(sql, obj);
        closeResourse();
        if (rows == 0) {
            System.out.println("数据添加失败!");
        }
        return rows;
    }
}
