package com.project.doran.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class MemberInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		boolean memberFlag = false;

		System.out.println("Login Interceptor");

		if (request.getSession().getAttribute("member") != null) { 

			System.out.println("회원 인증 !"); 
			memberFlag = true;

		} else { 

			System.out.println("회원 미인증 !"); 
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용해 주세요.'); location.href='/user/login';</script>");
			out.close();
			
			memberFlag = false;
		}

		return memberFlag;
	}

}
