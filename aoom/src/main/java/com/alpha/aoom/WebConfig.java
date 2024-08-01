package com.alpha.aoom;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.alpha.aoom.util.interceptor.SessionCheckInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		// 세션 체크 인터셉터
		registry.addInterceptor(new SessionCheckInterceptor())
				.order(1)	// 적용할 필터 순서 설정
				.addPathPatterns("/**") // 적용할 호출명 설정
				// 제외 할 호출명 설정
				.excludePathPatterns("/main", "/member/signup", "/member/ajaxSignup", "/member/ajaxSignout", 
						"/member/signin", "/member/ajaxSignin", "/userAuthNo/ajaxSend", "/userAuthNo/ajaxAuthCheck", 
						"/image/**" , "/room/roomInfo", "/room/roomList" , "/review/ajaxReviewPaging",
						"/room/ajaxResultRoom" , "/onedayPrice/ajaxValidDate" , "/onedayPrice/ajaxSelectDay","/style/**"
						);
		
		// 위 설정을 인터셉터에 적용
		WebMvcConfigurer.super.addInterceptors(registry);

	}
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/style/**")
                .addResourceLocations("/WEB-INF/view/style/");
    }
	
	
}
