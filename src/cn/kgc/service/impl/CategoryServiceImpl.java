package cn.kgc.service.impl;

import cn.kgc.dao.CategoryDao;
import cn.kgc.dao.NewsDao;
import cn.kgc.dao.impl.CategoryDaoImpl;
import cn.kgc.dao.impl.NewsDaoImpl;
import cn.kgc.pojo.CategoryBean;
import cn.kgc.service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao categoryDao;
    private NewsDao newsDao;

    //构造方法初始化CategoryDao和NewsDao
    public CategoryServiceImpl() {
        this.categoryDao = new CategoryDaoImpl();
        this.newsDao=new NewsDaoImpl();
    }

    @Override
    public List<CategoryBean> getCategoryListAll() {
        return categoryDao.getCategoryListAll();
    }

    @Override
    public boolean deleteCategoryById(int categoryId) {
        return deleteCategoryById(new CategoryBean(categoryId));
    }

    @Override
    public int addCategory(CategoryBean category) {
        return categoryDao.addCategory(category);
    }

    @Override
    public boolean deleteCategoryById(CategoryBean category) {
        boolean judge;
        int count=newsDao.countNewsByCategoryId(category);
        if (count>0){
            System.out.println("CategoryServiceImpl-deleteCategoryById:");
            System.out.println("there have this category's news in DB");
            System.out.println("U cant delete it");
            judge=false;
        }else if(count<0){
            System.err.println("CategoryServiceImpl-deleteCategoryById:error:count small than 0");
            judge=false;
        }else{
            count=categoryDao.deleteCategoryById(category);
            System.out.println(this.getClass().getSimpleName()+"删除时影响行数:"+count);
            if(count==1){
                judge=true;
            }else {
                judge=false;
                System.out.println("CategoryServiceImpl-deleteCategoryById:影响行数有问题");
            }
        }
        return judge;
    }
}
