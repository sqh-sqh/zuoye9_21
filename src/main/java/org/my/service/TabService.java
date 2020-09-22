package org.my.service;

import org.my.model.People;
import org.my.utils.TableData;

import java.util.List;

public interface TabService {
    TableData<People> list(int index, String user, String posi);

//    Integer listCount(String user,String posi);
    //保存修改
    void save(People people);
    //注册
    void reg(People pp);
    //登录
    List<People> login(String user,String passwd);
//    boolean login(String user,String passwd);
}
