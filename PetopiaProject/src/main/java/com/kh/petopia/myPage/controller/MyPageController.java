package com.kh.petopia.myPage.controller;

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
	
	@RequestMapping("alram.me")
	public String alramList(int mno, Model model) {
		System.out.println(mno);
		model.addAttribute("replyList", myPageService.alramReplyList(mno));
		System.out.println(myPageService.alramReplyList(mno));
		return "myPage/alram";
	}

}
