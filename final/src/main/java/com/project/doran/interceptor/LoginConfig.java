package com.project.doran.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class LoginConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/group/setting", "/mypage/**", "/chat/**")
				.excludePathPatterns("/css/**", "/fonts/**", "/images/**", "/js/**");
	}

}
