package com.alpha.aoom;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.alpha.aoom.util.interceptor.SessionCheckInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		// 세션 체크 인터셉터
		registry.addInterceptor(new SessionCheckInterceptor())
				.order(1)	// 적용할 필터 순서 설정
				.addPathPatterns("/**")
				.excludePathPatterns("/main", "/signup", "/signupAction", "/logout", "/signin", "/signinAction", "/send", "/authCheck");
		
		
		WebMvcConfigurer.super.addInterceptors(registry);

	}
	
}
