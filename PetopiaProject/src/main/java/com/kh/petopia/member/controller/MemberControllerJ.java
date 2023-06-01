package com.kh.petopia.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petopia.member.model.service.MemberService;

@Controller
public class MemberControllerJ {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "myPage/myPage";
	}

}
