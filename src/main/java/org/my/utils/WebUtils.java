package org.my.utils;

import com.alibaba.fastjson.JSONObject;

public class WebUtils {
    /**
     *
     * @param obj 后端的数据
     * @return json形式的返回值
     */
    public static String returnData(Object obj) {
        JSONObject data = (JSONObject) JSONObject.toJSON(obj);
        return data.toJSONString();
    }
}
