package com.project.doran.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.project.doran.user.vo.UserVO;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("member");
				

		boolean masterFlag = false;

		System.out.println("Login Interceptor");

		if ( userVO != null && userVO.getAuthority() == 1) {

			System.out.println("관리자 인증!!!"); 
			masterFlag = true;

		} else {

			System.out.println("관리자 미인증!!!"); 
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 부족합니다.'); location.href='/main';</script>");
			out.close();
			
			masterFlag = false;
		}

		return masterFlag;
	}
}
