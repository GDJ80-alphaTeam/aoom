package com.alpha.aoom.util.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SigninInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("인터셉터 호출");
		
		if(session == null || session.getAttribute("userInfo") == null) {
			System.out.println("session 값 없음");
			response.sendRedirect(request.getContextPath() + "/signin");
			return false;
			
		}
		
		return true;
	}
	
}
