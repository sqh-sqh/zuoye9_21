package org.my.controller;

import com.alibaba.fastjson.JSONObject;
import org.my.model.Goods;
import org.my.service.GoodsService;
import org.my.utils.TableData;
import org.my.utils.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class GoodsController {
    //将所有的重复操作（如：getbean）交给springmvc
    @Resource
    private GoodsService gs;

    @RequestMapping("/goods")
    @ResponseBody
    public String list(String code, String format,Integer index){
        // 校验参数
        if (index == null) {
            index = 1;
        }

        // 调用Service
        TableData<Goods> list = gs.list(index, code,format);

        // 结果处理
        return WebUtils.returnData(list);
    }

    @RequestMapping("/save.ajax")
    @ResponseBody
    public String save(Goods goods) {
        gs.save(goods);

        System.out.println(goods.toString());

        JSONObject data = new JSONObject();
        data.put("type", true);
        return data.toJSONString();
    }

    @RequestMapping("/add.ajax")
    @ResponseBody
    public String add(Goods goods) {
        gs.add(goods);

        System.out.println(gs.toString());

        JSONObject data = new JSONObject();
        data.put("a", true);
        return data.toJSONString();
    }

    @RequestMapping("/del.ajax")
    @ResponseBody
    public String del(String ids) {
        System.out.println(ids);

        JSONObject data = new JSONObject();
        if (StringUtils.isEmpty(ids)) {
            data.put("type", false);
            return data.toJSONString();
        }

        String[] idListStr = ids.split(",");
        List<Integer> idList = new ArrayList<>();
        for (String isStr : idListStr) {
            int id = Integer.parseInt(isStr);
            idList.add(id);
        }

        // 调用Service
        gs.del(idList);

        data.put("type", true);
        return data.toJSONString();
    }
}
