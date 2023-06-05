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
	
	// 알람 - 댓글
	@RequestMapping("alramReply.me")
	public String alramReplyList(int mno, Model model) {
		System.out.println(mno);
		model.addAttribute("replyList", myPageService.alramReplyList(mno));
		System.out.println(myPageService.alramReplyList(mno));
		return "myPage/alramReply";
	}
//	// 알람 - 공지사항(1:1댓글알림)
//	@RequestMapping("alramNotice.me")
//	public String alramNoticeList(int mno, Model model) {
//		System.out.println("공지사항 : " + mno);
//		model.addAttribute("noticeList", myPageService.alramNoticeList(mno));
//		return "myPage/alramNotice";
//	}
//	// 알람 - 쿠폰
//	@RequestMapping("alramCoupon.me")
//	public String alramCouponList(int mno, Model model) {
//		System.out.println("쿠폰 : " + mno);
//		model.addAttribute("couponList", myPageService.alramCouponList(mno));
//		return "myPage/alramCoupon";
//	}
//	// 알람 - 배송
//	@RequestMapping("alramShipping.me")
//	public String alramShippingList(int mno, Model model) {
//		System.out.println("배송 : " + mno);
//		model.addAttribute("shippingList", myPageService.alramShippingList(mno));
//		return "myPage/alramShipping";
//	}
	

}
