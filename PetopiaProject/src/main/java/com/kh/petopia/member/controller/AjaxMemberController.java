package com.kh.petopia.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.petopia.member.model.service.MemberService;

@RestController
@Controller
public class AjaxMemberController {
	
	
	@Autowired
	private MemberService memberServicve;
	
	@RequestMapping("emailCheck.me")
	public String emailCheck(String checkEmail) {
		
		return memberServicve.emailCheck(checkEmail) >0 ? "NNN" : "YYY";
	}
	

	
	@RequestMapping("nicknameCheck.me")
	public String nicknameCheck(String nickname) {
		
		return memberServicve.nicknameCkeck(nickname) >0 ? "NNN" : "YYY";
	}
	
	
	
	
	
	

}