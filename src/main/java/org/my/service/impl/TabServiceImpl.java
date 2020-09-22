package org.my.service.impl;

import org.apache.ibatis.session.RowBounds;
import org.my.dao.PeopleMapper;
import org.my.model.People;
import org.my.service.TabService;
import org.my.utils.PageUtils;
import org.my.utils.TableData;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("tabService")
public class TabServiceImpl implements TabService {
    /**
     * 一页几条数据
     * @Value() 与 private int pageSize;为一对，一一对应
     */
    @Value("${pagesize}")
    private int pageSize;

    @Resource
    private PeopleMapper mapper;

    @Override
    public TableData<People> list(int index, String user, String posi) {
        // 构造结果数据
        TableData<People> td = new TableData<>();
        td.setPageIndex(index);
        td.setPageSize(pageSize);

        // 查询数据条数
        Integer count = mapper.listCount(user, posi);
        td.setDataCount(count);
        if (count <= 0) {
            return td;
        }

        // 查询数据
        RowBounds rb = PageUtils.getRowBounds(index, pageSize);
        List<People> list = mapper.list(rb, user, posi);
        td.setDataList(list);
        return td;
    }

    @Override
    public void save(People people) {
        //修改
        mapper.save(people);
    }

    @Override
    public void reg(People pp) {
        //调用新的dao
        mapper.add(pp);
    }

    @Override
    public List<People> login(String uname, String passwd) {
        List<People> login = mapper.login(uname, passwd);
        return login;
    }
}
