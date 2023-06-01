package com.kh.petopia.member.controller;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.petopia.member.model.service.MemberService;

@RestController
@Controller
public class AjaxMemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	
	
	@RequestMapping(value="emailCheck.me", produces="text/html; charset=UTF-8")
	public String emailCheck(String checkEmail) {
		
		return memberService.emailCheck(checkEmail) >0 ? "NNN" : "YYY";
	}
	

	
	@RequestMapping(value="nicknameCheck.me", produces="text/html; charset=UTF-8")
	public String nicknameCheck(String nickname) {
		
		return memberService.nicknameCkeck(nickname) >0 ? "NNN" : "YYY";
	}
	
	
	@PostMapping(value ="findEmail.me", produces="text/html; charset=UTF-8")
	public String findEmail(String nickname) {
		
		String email = memberService.findEmail(nickname);
		System.out.println(email);
		return email != null ? email: "NO";
	}
	
	

	
	

	
	

}