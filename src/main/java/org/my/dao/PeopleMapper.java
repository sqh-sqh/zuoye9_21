package org.my.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.my.model.People;

import java.util.List;

public interface PeopleMapper {
    //注册
    Integer add(@Param("pp") People pp);
    //查询
    List<People> list(RowBounds rb, @Param("user") String user, @Param("posi") String posi);
    //计数
    Integer listCount(@Param("user") String user,@Param("posi") String posi);
    //保存修改
    Integer save(@Param("people") People people);
    //登录
    List<People> login(@Param("user") String user,@Param("passwd") String passwd);
}
