package org.kosta.tomorad.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {// 로그인상태아니면 
			System.out.println("로그인 하지 않고 서비스 접근");
			response.sendRedirect(request.getContextPath() +"/loginalert.do");
			return false;
		}
		System.out.println("로그인하고 제대로 서비스 접근");
		return true;
	}
}
