package org.kosta.tomoroad.controller.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginCheckInterceptor implements HandlerInterceptor {
	
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
