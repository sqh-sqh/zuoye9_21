package org.my.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.my.model.Goods;

import java.util.List;

public interface GoodsMapper {
    //新增
    Integer add(@Param("gs") Goods gs);
    //查询
    List<Goods> list(RowBounds rb, @Param("code") String code, @Param("format") String format);
    //计数
    Integer listCount(@Param("code") String code, @Param("format") String format);
    //保存修改
    Integer save(@Param("goods") Goods goods);
    //删除
    Integer del(@Param("ids") List<Integer> ids);
}
