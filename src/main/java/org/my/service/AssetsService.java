package org.my.service;

import org.my.dto.AssetsDto;
import org.my.model.Goods;

import java.util.List;

public interface AssetsService {
    List<AssetsDto> list(int index, String assetsCall, String user);

    Integer listCount(String code,String format);
    //保存修改
    void save(AssetsDto assets);
    //保存新增
//    public void add(Goods gs);
    //删除
//    void del(List<Integer> goodId);
}
