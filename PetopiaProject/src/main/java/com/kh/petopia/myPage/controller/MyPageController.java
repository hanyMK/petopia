package com.kh.petopia.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.common.template.Pagination;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.myPage.model.service.MyPageService;
import com.kh.petopia.myPage.model.vo.Petpay;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	// 헤더 마이페이지 클릭
	@RequestMapping("myPage.me")
	public String myPage(int mno) {
		//MyPage myPage = new MyPage();
		//회원 등급 조회
		//myPage.setRating(myPageService.getMemberRating(mno));
		
		return "myPage/myPage";
	}
	
	// 마이페이지 게시글 조회
	@RequestMapping("myBoard.me")
	public String myBoardList(int mno, Model model) {
		model.addAttribute("list", myPageService.myBoardList(mno));
		return "myPage/myBoardList";
	}
	
	// 알람 iframe페이지
	@RequestMapping("alram.me")
	public String alramList(int mno, Model model) {
		model.addAttribute("list", myPageService.alramList(mno));
		return "myPage/alramList";
	}
	
	// 헤더 마이페이지 클릭
	@RequestMapping("myPetpayPoint.me")
	public String myPetpayPoint(int mno, Model model) {
		// 전체금액, 총 n건, 날짜, 사용, 충전
		
		// 전체금액, 총 n건 int 타입으로 받아오기
		model.addAttribute("petpayAmount", myPageService.selectMemberPetPay(mno));
		model.addAttribute("pointAmount", myPageService.selectMemberPoint(mno));
		
		model.addAttribute("petpayCount", myPageService.selectPetPayCount(mno));
		model.addAttribute("pointCount", myPageService.selectPointCount(mno));
		
		// 금액, 날짜, 사용M, 충전P ArrayList
		model.addAttribute("petpayList", myPageService.myPetpayList(mno));
		model.addAttribute("pointList", myPageService.myPointList(mno));

		return "myPage/myPetpayPoint";
	}
	
	
	@RequestMapping("memberCouponList.me")
	public String memberCouponListView() {
		return "myPage/memberCouponList";
	}
	
	// 마이페이지 펫페이 충전
	@RequestMapping("insertChargePetpay.me")
	public String insertChargePetpay(int memberNo, int petpayAmount, HttpSession session, Model model) {
		Petpay p = new Petpay();
		p.setMemberNo(memberNo);
		p.setPetpayAmount(petpayAmount);
		
		if(myPageService.insertChargePetpay(p) > 0) {
			session.setAttribute("alertMsg", "펫페이 충전 완료!");
			return "redirect:myPetpayPoint.me?mno=" + memberNo;
		} else {
			model.addAttribute("errorMsg", "펫페이 충전 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insertWithdrawPetpay.me")
	public String insertWithdrawPetpay(int memberNo, int petpayAmount, HttpSession session, Model model) {
		Petpay p = new Petpay();
		p.setMemberNo(memberNo);
		p.setPetpayAmount(petpayAmount);
		
		if(myPageService.insertWithdrawPetpay(p) > 0) {
			session.setAttribute("alertMsg", "펫페이 인출 완료!");
			return "redirect:myPetpayPoint.me?mno=" + memberNo;
		} else {
			model.addAttribute("errorMsg", "펫페이 충전 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("myReview.me")
	public String myReviewList(int mno, Model model) {
		System.out.println(mno);
		model.addAttribute("list", myPageService.myReviewList(mno));
		return "myPage/myReviewList";
	}
	
	@RequestMapping("orderList.me")
	public ModelAndView selectOrderList(int currentPage,
										ModelAndView mv,
										HttpSession session) {
		int memberNo =((Member)session.getAttribute("loginMember")).getMemberNo();
		PageInfo pi = Pagination.getPageInfo(myPageService.orderListCount(memberNo), currentPage, 10, 10);
		return mv;
	}
	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
