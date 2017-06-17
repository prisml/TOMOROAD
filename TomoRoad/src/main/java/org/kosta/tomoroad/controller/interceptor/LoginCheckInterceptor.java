package org.kosta.tomoroad.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("manager") == null){
			if (session.getAttribute("mvo") == null) {// 로그인상태아니면 
				response.sendRedirect(request.getContextPath() +"/loginalert.do");
				return false;
			}
		}
		return true;
	}
}
