package com.kh.petopia.common.Interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.petopia.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Member admin = (Member)request.getSession().getAttribute("loginMember");
		if(admin != null && admin.getMemberNo() == 1) {
			return true;
		}else {
			request.setAttribute("alertMsg", "관리자 페이지 입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		
	}

}
