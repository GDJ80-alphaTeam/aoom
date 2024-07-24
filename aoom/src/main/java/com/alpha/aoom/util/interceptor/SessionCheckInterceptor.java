package com.alpha.aoom.util.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SessionCheckInterceptor implements HandlerInterceptor{

	/**
	 * 날짜 : 2024.07.07
	 * 작성자 : 손지원
	 * 설명 : 로그인 인터셉터
	 * =============== 개정이력 ===============
	 *
	 * 수정일       수정자       수정내용
	 * ----------------------------------------
	 * 0000.00.00   홍길동       내용
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 현재 세션 불러오기, 세션 없을 시 세션 생성되지 않게 false로
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("userInfo") == null) {
			System.out.println("인터셉터 실행 메인으로 이동");
			response.sendRedirect(request.getContextPath() + "/main");
			return false;
		}
		
		return true;
	}
	
}
