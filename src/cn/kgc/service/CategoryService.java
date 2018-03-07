package cn.kgc.service;

import cn.kgc.pojo.CategoryBean;

import java.util.List;

public interface CategoryService {
    //delete category
    boolean deleteCategoryById(CategoryBean category);

    boolean deleteCategoryById(int categoryId);

    int addCategory(CategoryBean category);

    List<CategoryBean> getCategoryListAll();
}
