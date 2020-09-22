package org.my.service.impl;

import org.apache.ibatis.session.RowBounds;
import org.my.dao.FinanceMapper;
import org.my.model.Finance;
import org.my.service.FinanceService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("financeService")
public class FinanceServiceImpl implements FinanceService {
    /**
     * 一页几条数据
     * @Value() 与 private int pageSize;为一对，一一对应
     */
    @Value("${pagesize}")
    private int pageSize;

    @Resource
    private FinanceMapper mapper;

    @Override
    public List<Finance> list(int index, String user,String voucher) {
        // 分页数据计算
        int offset = (index - 1) * pageSize;
        int limit = pageSize;

        //获取SQL语句中需要的offset, limit值
        RowBounds rb = new RowBounds(offset, limit);
        //调用Dao
        List<Finance> list = mapper.list(rb, user, voucher);
        return list;
    }

    @Override
    public Integer listCount(String user,String voucher) {
        //调用Dao
        Integer count = mapper.listCount(user,voucher);

        // 计算最大页数
        int max = (count % pageSize == 0) ? (count / pageSize) : (count / pageSize + 1);
        return max;
    }

    @Override
    public void save(Finance finance) {
        mapper.save(finance);
    }

    @Override
    public void add(Finance fi) {
        mapper.add(fi);
    }

    @Override
    public void del(Integer financeId) {
        mapper.del(financeId);
    }
}
