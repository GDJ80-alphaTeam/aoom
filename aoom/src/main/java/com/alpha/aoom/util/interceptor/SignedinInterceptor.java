package com.alpha.aoom.util.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SignedinInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userInfo"));
		System.out.println("로그인 되어있을때 인터셉터 호출");
		
		if(session.getAttribute("userInfo") != null) {
			System.out.println("session 값 있음");
			response.sendRedirect(request.getContextPath() + "/main");
			return false;
			
		}
		
		return true;
	}

	
}
