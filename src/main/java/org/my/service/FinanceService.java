package org.my.service;

import org.my.model.Finance;

import java.util.List;

public interface FinanceService {
    List<Finance> list(int index, String user,String voucher);

    Integer listCount(String user,String voucher);
    //保存修改
    void save(Finance finance);
    //保存新增
    public void add(Finance fi);
    //删除
    void del(Integer financeId);
}
