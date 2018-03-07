package cn.kgc.pojo;

import java.util.Date;

public class CategoryBean {
    private int id;
    private String name;
    private Date createDate;

    public CategoryBean() {

    }

    //查询用构造方法,只输入id
    public CategoryBean(int id) {
        this.id = id;
    }

    //增加用构造方法,输入分类名称
    //java赋值当前时间,数据库自动设定id
    public CategoryBean(String name) {
        this.name = name;
        this.createDate = new Date();
    }
    //测试用构造方法,输入id和name
    //java赋值当前时间
    public CategoryBean(int id,String name) {
        this.id=id;
        this.name = name;
        this.createDate = new Date();
    }
    @Override
    public String toString() {
        return "CategoryBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", createDate=" + createDate +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
