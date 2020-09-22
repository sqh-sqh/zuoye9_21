package org.my.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.my.dto.AssetsDto;
import org.my.model.Goods;

import java.util.List;

public interface AssetsMapper {
    //新增
//    Integer add(@Param("assets") AssetsDto assets);
    //查询
    List<AssetsDto> list(RowBounds rb, @Param("assetsCall") String assetsCall, @Param("user") String user);
    //计数
    Integer listCount(@Param("assetsCall") String assetsCall, @Param("user") String user);
    //保存修改
    Integer save(@Param("assetsDto") AssetsDto assetsDto);
    //删除
//    Integer del(@Param("ids") List<Integer> ids);
    //联合
//    List<AssetsDto> get();
}
