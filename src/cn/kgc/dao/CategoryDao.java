package cn.kgc.dao;

import cn.kgc.pojo.CategoryBean;

import java.util.List;

public interface CategoryDao {

    public int deleteCategoryById(CategoryBean category);
    public int deleteCategoryById(int categoryId);

    public int addCategory(CategoryBean category);

    public List<CategoryBean> getCategoryListAll();
}
