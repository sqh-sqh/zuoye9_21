package org.my.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.my.model.Finance;

import java.util.List;

public interface FinanceMapper {
    //新增
    Integer add(@Param("fi") Finance fi);
    //查询
    List<Finance> list(RowBounds rb, @Param("user") String user, @Param("voucher") String voucher);
    //计数
    Integer listCount(@Param("user") String user, @Param("voucher") String voucher);
    //保存修改
    Integer save(@Param("finance") Finance finance);
    //删除
    Integer del(@Param("financeId") Integer financeId);
}
