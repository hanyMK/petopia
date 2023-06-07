package com.kh.petopia.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petopia.myPage.model.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	// 헤더 마이페이지 클릭
	@RequestMapping("myPage.me")
	public String myPage() {
		return "myPage/myPage";
	}
	
	// 마이페이지 게시글 조회
	@RequestMapping("myBoard.me")
	public String myBoardList(int mno, Model model) {
		model.addAttribute("list", myPageService.myBoardList(mno));
		return "myPage/myBoardList";
	}
	
	// 알람 iframe 초기페이지
	@RequestMapping("alramReply.me")
	public String alramReplyList(int mno, Model model) {
		System.out.println(mno);
		model.addAttribute("replyList", myPageService.alramReplyList(mno));
		System.out.println(myPageService.alramReplyList(mno));
		return "myPage/alramList";
	}
	
}
