package com.alpha.aoom.util.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SessionCheckInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 현재 세션 불러오기, 세션 없을 시 세션 생성되지 않게 false로
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("userInfo") == null) {
			System.out.println("인터셉터 조건문 걸림");
			response.sendRedirect(request.getContextPath() + "/member/signinView");
			return false;
		}
		
		return true;
	}
	
}
