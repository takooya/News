package cn.kgc.util;

import cn.kgc.service.NewsService;
import cn.kgc.service.impl.NewsServiceImpl;

public class Paging {
    //每页显示几条新闻
    private int totalNewsInPage;
    //总页数
    private int totalPage;
    //总新闻数
    private int totalNews;
    //当前新闻页数
    private int currentPage;

    @Override
    public String toString() {
        return "Paging{" +
                "totalNewsInPage=" + totalNewsInPage +
                ", totalPage=" + totalPage +
                ", totalNews=" + totalNews +
                ", currentPage=" + currentPage +
                '}';
    }

    public Paging() {
        NewsService newsService=new NewsServiceImpl();
        totalNews=newsService.countAllNews();
        totalNewsInPage=5;
        if (totalNews % totalNewsInPage == 0) {
            totalPage = totalNews / totalNewsInPage;
        } else {
            totalPage = totalNews / totalNewsInPage + 1;
        }
    }

    public int getTotalNewsInPage() {
        return totalNewsInPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getTotalNews() {
        return totalNews;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    //重设每页显示几条新闻
    public void setTotalNewsInPage(int totalNewsInPage) {
        this.totalNewsInPage = totalNewsInPage;
        if (this.totalNews % this.totalNewsInPage == 0) {
            this.totalPage = this.totalNews / this.totalNewsInPage;
        } else {
            this.totalPage = this.totalNews / this.totalNewsInPage + 1;
        }
        System.out.println(this.toString());
    }
}
