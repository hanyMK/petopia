package com.kh.petopia.member.controller;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.petopia.member.model.service.MemberService;
import com.kh.petopia.member.model.vo.CertVO;
import com.kh.petopia.member.model.vo.Member;

@RestController
public class AjaxMemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private BCryptPasswordEncoder bcyptPasswordEncoder;
	
	
	private CertVO certVo = new CertVO();

	
	
	@RequestMapping(value="emailCheck.member", produces="text/html; charset=UTF-8")
	public String emailCheck(String checkEmail) {
		
		return memberService.emailCheck(checkEmail) >0 ? "NNN" : "YYY";
	}
	

	
	@RequestMapping(value="nicknameCheck.member", produces="text/html; charset=UTF-8")
	public String nicknameCheck(String nickname) {
		
		return memberService.nicknameCkeck(nickname) >0 ? "NNN" : "YYY";
	}
	
	
	@PostMapping(value ="findEmail.member", produces="text/html; charset=UTF-8")
	public String findEmail(String nickname) {
		
		String email = memberService.findEmail(nickname);
		System.out.println(email);
		return email != null ? email: "NO";
	}
	
	
	@PostMapping(value="findPwd.member", produces="text/html; charset=UTF-8")
	public String findPwd(String checkEmail, Model m) throws MessagingException {
		String key = randomString();
		System.out.println("이메일 "+checkEmail);
		
		
		
		String url = getUrl(key);
	//	member.put(key, getMember(checkEmail));
		String btnStyle = "width: 200px; height: 50px; background-color: #FAC264 ;";
		String atagStyle = "text-decoration: none; color: black; font-weight: 900;";
		
		
		
		//안내 메세지
		StringBuilder str = new StringBuilder();
		str.append(" <h1>내 계정 찾기</h1>")
		.append(" <p>회원님읜 계정은 <b>"+ checkEmail + "</b>입니다</p>")
		.append(" <p>비밀번호를 재설정하려면 다음 링크를 클릭해 변경해 주세요. 링크는 10분만 유효합니다</p>")
		.append(" <button style=\""+ btnStyle +"\"><a style=\""+ atagStyle +"\" href=\""+ url +"\">비밀번호 재설정</a></button>\r\n")
		.append(" <p>만약, 가입한 적이 없거나 내 계정 찾기 요청을하지 않으신 경우 이 메일을 삭제 또는 무시해 주세요.</p>");
		//System.out.println(str.toString());
	
	
	
		if(!checkEmail.equals("") && (memberService.emailCheck(checkEmail) > 0)) {
			
			certVo.setWho(checkEmail);
			certVo.setSecret(key);
			
			memberService.sendMail(certVo);
		
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8" );
			helper.setTo(checkEmail);
			helper.setSubject("펫토피아에서 비밀번호 재설정을 위한 메일을 발송드립니다");
			helper.setText(str.toString(), true);
			
			sender.send(message);
			
			return "YES";
		
		}else {
			m.addAttribute("alertMsg", "다시 시도해 주세요");
			
			return "NO";
		}
		
		
	}
	
	
	private String randomString() {
		
		return UUID.randomUUID().toString();
	}
	
	
	private String getUrl(String key) {
		String url = ServletUriComponentsBuilder
				.fromCurrentContextPath()
				.port(8282)
				.path("/resetPwd")
				.queryParam("mode", "change_password")
				.queryParam("k",key)
				.toUriString();
		return url;
	
	
	}
//	
//	public void sendMail(String key, String email) {
//		
//		certVo.builder()	
//			.who(email)
//			.secret(key)
//			.build();
//		System.out.println("sendMail "+ certVo);
//		
//		memberService.sendMail(certVo);
//		
//	}
	
	
	@RequestMapping("updatePwd.member")
	public String resetPwd(String k, String memberPwd) {
		
		//certVo.setSecret(k);
		//System.out.println(certVo);
		//System.out.println("여기왜 안와    "+certVo.getWho());
		
		System.out.println(memberService.validata(certVo));
		if(memberService.validata(certVo)) {
//			if(member.get(k).getCodeDate()-1 )
			Member m = new Member();
			System.out.println(certVo.getWho());
			m.setEmail(certVo.getWho());
			m.setMemberPwd(bcyptPasswordEncoder.encode(memberPwd));
			
			return  memberService.updatePwd(m) >0 ? "YES" : "NO";
			
		}else {
			return "NO";
		}
	
	}


	

}