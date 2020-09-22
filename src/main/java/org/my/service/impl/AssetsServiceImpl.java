package org.my.service.impl;

import org.apache.ibatis.session.RowBounds;
import org.my.dao.AssetsMapper;
import org.my.dto.AssetsDto;
import org.my.model.Goods;
import org.my.service.AssetsService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AssetsServiceImpl implements AssetsService {
    /**
     * 一页几条数据
     * @Value() 与 private int pageSize;为一对，一一对应
     */
    @Value("${pagesize}")
    private int pageSize;

    //将所有的重复操作（如：连接数据库和关闭数据库）交给springmvc
    @Resource
    private AssetsMapper mapper;

    @Override
    public List<AssetsDto> list(int index, String assetsCall, String user) {
        // 分页数据计算
        int offset = (index - 1) * pageSize;
        int limit = pageSize;

        //获取SQL语句中需要的offset, limit值
        RowBounds rb = new RowBounds(offset, limit);
        //调用Dao
        List<AssetsDto> list = mapper.list(rb, assetsCall, user);
        return list;
    }

    @Override
    public Integer listCount(String assetsCall,String user) {
        //调用Dao
        Integer count = mapper.listCount(assetsCall, user);

        // 计算最大页数
        int max = (count % pageSize == 0) ? (count / pageSize) : (count / pageSize + 1);
        return max;
    }

    @Override
    public void save(AssetsDto assets) {
        mapper.save(assets);
    }

}
