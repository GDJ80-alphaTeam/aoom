package com.alpha.aoom;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.alpha.aoom.util.interceptor.SignedinInterceptor;
import com.alpha.aoom.util.interceptor.SigninInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		// 로그인이 안 되어있을 때 실행되는 인터셉터
		registry.addInterceptor(new SigninInterceptor())
				.order(1)	// 적용할 필터 순서 설정
				.addPathPatterns("/**")
				.excludePathPatterns("/main", "/signin", "/signinAction", "/logout", "/signup", "/signupAction");	// 제외할 경로 패턴
		
		// 로그인이 되어있을 때 접근 불가능한 경로		
		registry.addInterceptor(new SignedinInterceptor())
				.order(2)
				.addPathPatterns("/signin", "/signinAction", "signup", "signupAction");
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}
