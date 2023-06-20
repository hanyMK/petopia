package com.kh.petopia.common.Interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler ) throws IOException {
		
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginMember") != null) {
			return true;
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요");
			response.sendRedirect(request.getContextPath());
			return false;
			
		}
		
	}

}
