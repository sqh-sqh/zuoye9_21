package org.my.controller;

import com.alibaba.fastjson.JSONObject;
import org.my.dto.AssetsDto;
import org.my.model.Goods;
import org.my.service.AssetsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class AssetsController {
    //将所有的重复操作（如：getbean）交给springmvc
    @Resource
    private AssetsService as;

    @RequestMapping("/assets")
    @ResponseBody
    public String list(String assetsCall, String user,Integer index){
        // 校验参数
        if (index == null) {
            index = 1;
        }

        // 调用Service
        List<AssetsDto> list = as.list(index, assetsCall,user);
        Integer max = as.listCount(assetsCall,user);

        // 结果处理
        JSONObject data = new JSONObject();
        data.put("list", list);
        data.put("max", max);

        return data.toJSONString();
    }

    @RequestMapping("/saveAssets.ajax")
    @ResponseBody
    public String save(AssetsDto assets) {
        as.save(assets);

        JSONObject data = new JSONObject();
        data.put("type", true);
        return data.toJSONString();
    }

}
