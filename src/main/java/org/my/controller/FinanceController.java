package org.my.controller;

import com.alibaba.fastjson.JSONObject;
import org.my.model.Finance;
import org.my.service.FinanceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class FinanceController {
    @Resource
    FinanceService fs;

    @RequestMapping("/finance")
    @ResponseBody
    public String list(String user,String voucher, Integer index){
        // 校验参数
        if (index == null) {
            index = 1;
        }

        // 调用Service
        List<Finance> list = fs.list(index, user,voucher);
        Integer max = fs.listCount(user,voucher);

        // 结果处理
        JSONObject data = new JSONObject();
        data.put("list", list);
        data.put("max", max);

        return data.toJSONString();
    }

    @RequestMapping("/saveFinance.ajax")
    @ResponseBody
    public String save(Finance f) {
        fs.save(f);

        System.out.println(f.toString());

        JSONObject data = new JSONObject();
        data.put("type", true);
        return data.toJSONString();
    }

    @RequestMapping("/addFinance.ajax")
    @ResponseBody
    public String add(Finance fi) {
        fs.add(fi);

        System.out.println(fi.toString());

        JSONObject data = new JSONObject();
        data.put("f", true);
        return data.toJSONString();
    }

    @RequestMapping("/delFinance.ajax")
    @ResponseBody
    public String del(Integer financeId) {
        System.out.println(financeId);

        JSONObject data = new JSONObject();
        if (financeId == null || financeId <= 0) {
            data.put("type", false);
            return data.toJSONString();
        }

        // 调用Service
        fs.del(financeId);

        data.put("type", true);
        return data.toJSONString();
    }
}
