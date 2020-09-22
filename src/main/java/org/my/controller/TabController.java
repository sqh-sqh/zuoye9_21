package org.my.controller;

import com.alibaba.fastjson.JSONObject;
import org.my.model.People;
import org.my.service.TabService;
import org.my.utils.TableData;
import org.my.utils.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class TabController {
    @Resource
    private TabService ts;

    @RequestMapping("/people")
    @ResponseBody
    public String list(String user,String posi, Integer index){
        // 校验参数
        if (index == null) {
            index = 1;
        }

        // 调用Service
        TableData<People> list = ts.list(index,user,posi);

        // 结果处理
        return WebUtils.returnData(list);
    }

    @RequestMapping("/tab.ajax")
    @ResponseBody
    public String save(People p) {
        ts.save(p);

        System.out.println(p.toString());

        JSONObject data = new JSONObject();
        data.put("t", true);
        return data.toJSONString();
    }

    @RequestMapping("/reg.ajax")
    @ResponseBody
    public String reg(People pp) {
        System.out.println(pp.toString());
        // 调用Service
        ts.reg(pp);

        JSONObject data = new JSONObject();
        data.put("people", true);
        return data.toJSONString();
    }

    @RequestMapping("/login.ajax")
    @ResponseBody
    public String login(String uname, String passwd,HttpServletRequest request) {
        List<People> login = ts.login(uname, passwd);
        System.out.println("登陆信息："+login);
        //状态码
        int code = 1;
        if (login == null) {
            code = -1;
        } else {
            code = 1;
        }

        //登录状态
        String logined = login.get(0).getName();
        request.getSession().setAttribute("logined", logined);

        JSONObject data = new JSONObject();
        data.put("logined", logined);
        data.put("code", code);
        return data.toJSONString();
    }

    @RequestMapping("/out")
    @ResponseBody
    public String outLogin(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().setAttribute("logined",null);

        JSONObject data = new JSONObject();
        data.put("suc", true);
        return data.toJSONString();
    }
}
