package org.my.service;

import org.my.model.Goods;
import org.my.utils.TableData;

import java.util.List;

public interface GoodsService {
    TableData<Goods> list(int index, String code, String format);

//    Integer listCount(String code,String format);
    //保存修改
    void save(Goods goods);
    //保存新增
    public void add(Goods gs);
    //删除
    void del(List<Integer> goodId);
}
