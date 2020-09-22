package org.my.service.impl;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.my.dao.GoodsMapper;
import org.my.model.Goods;
import org.my.model.People;
import org.my.service.GoodsService;
import org.my.utils.PageUtils;
import org.my.utils.TableData;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    /**
     * 一页几条数据
     * @Value() 与 private int pageSize;为一对，一一对应
     */
    @Value("${pagesize}")
    private int pageSize;

    //将所有的重复操作（如：连接数据库和关闭数据库）交给springmvc
    @Resource
    private GoodsMapper mapper;

    @Override
    public TableData<Goods> list(int index, String code, String format) {
        // 构造结果数据
        TableData<Goods> td = new TableData<>();
        td.setPageIndex(index);
        td.setPageSize(pageSize);

        // 查询数据条数
        Integer count = mapper.listCount(code, format);
        td.setDataCount(count);
        if (count <= 0) {
            return td;
        }

        // 查询数据
        RowBounds rb = PageUtils.getRowBounds(index, pageSize);
        List<Goods> list = mapper.list(rb, code, format);
        td.setDataList(list);
        return td;
    }

    @Override
    public void save(Goods goods) {
        //保存修改
        mapper.save(goods);
    }

    @Override
    public void add(Goods gs) {
        //新增保存
        mapper.add(gs);
    }

    @Override
    public void del(List<Integer> ids) {
        mapper.del(ids);
    }
}
