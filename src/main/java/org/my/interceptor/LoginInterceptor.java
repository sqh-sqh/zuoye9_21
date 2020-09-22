package org.my.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    /**
     * @param request
     * @param response
     * @param handler
     * @return true放过 || false拦截
     * @throws Exception 异常
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
//        登录时判断登录状态进行拦截或放行
//        Object logined = request.getSession().getAttribute("logined");
//        if (logined != null) {
//            // 放过
//            return true;
//        } else {
//            response.sendRedirect("login.html");
//            return false;
//        }

    }
}
