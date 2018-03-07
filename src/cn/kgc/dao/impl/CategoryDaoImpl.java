package cn.kgc.dao.impl;

import cn.kgc.dao.CategoryDao;
import cn.kgc.dao.Connect;
import cn.kgc.pojo.CategoryBean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl extends Connect implements CategoryDao {

    @Override
    public int deleteCategoryById(CategoryBean category) {
        int rows;
        System.out.println(this.getClass().getSimpleName()+":"+category.toString());
        if (category.getId() != 0) {
            String sql = "DELETE FROM news_category WHERE id=?";
            Object obj[] = {category.getId()};
            rows = update(sql, obj);
            if(rows!=1) System.out.println(this.getClass().getSimpleName()+":影响行数有问题");
        } else {
            System.err.println("CategoryDaoImpl-deleteCategoryById:The id(FROM category) is 0.");
            rows = 0;
        }
        closeResourse();
        return rows;
    }
    public int deleteCategoryById(int categoryId) {
        return deleteCategoryById(new CategoryBean(categoryId));
    }

    @Override
    public int addCategory(CategoryBean category) {
        int rows;
        if (category.getId() != 0) {
            String sql = "INSERT INTO news_category (id,`name`,createDate) VALUES(?,?,?)";
            Object obj[] = {category.getId(),category.getName(),category.getCreateDate()};
            rows = update(sql, obj);
            if(rows!=1){
                System.out.println(this.getClass().getSimpleName()+"添加时影响的行数有问题");
            }
        } else {
            System.err.println("CategoryDaoImpl-addCategory:The id(FROM category) is 0.");
            rows = 0;
        }
        closeResourse();
        return rows;
    }

    @Override
    public List<CategoryBean> getCategoryListAll() {
        List<CategoryBean> list;
        try {
            String sql="SELECT id,`name`,createDate FROM news_category";
            Object obj[]={};
            rstSet=query(sql,obj);
            list=new ArrayList<>();
            while (rstSet.next()){
                CategoryBean bean=new CategoryBean();
                bean.setId(rstSet.getInt("id"));
                bean.setName(rstSet.getString("name"));
                bean.setCreateDate(rstSet.getDate("createDate"));
                list.add(bean);
            }
            if (list==null||list.isEmpty()||list.size()==0){
                System.err.println(this.getClass().getSimpleName()+":list is empty");
                list=null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            list=null;
        }finally {
            closeResourse();
        }
        return list;
    }
}
