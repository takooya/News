create schema if not exists news_manage_sys collate utf8_general_ci;

create table if not exists news_category
(
    id int auto_increment
        primary key,
    name varchar(20) not null,
    createDate timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP
);

create table if not exists news_detail
(
    id int auto_increment
        primary key,
    categoryId int not null,
    title varchar(20) not null,
    summary varchar(50) null comment '概要',
    content varchar(255) null comment '内容',
    picPath varchar(255) null comment '图片路径',
    author varchar(20) null comment '作者名',
    createDate timestamp default CURRENT_TIMESTAMP not null,
    modifyDate timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP
);

create table if not exists news_user
(
    id int auto_increment
        primary key,
    userName varchar(20) not null,
    password varchar(20) not null,
    email varchar(320) not null,
    userType int null
);

