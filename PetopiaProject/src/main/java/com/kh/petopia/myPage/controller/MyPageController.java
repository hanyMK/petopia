package com.kh.petopia.myPage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.common.template.Pagination;
import com.kh.petopia.myPage.model.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	// 헤더 마이페이지 클릭
	@RequestMapping("myPage.me")
	public String myPage(int mno) {
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
	
//	
//	
//	//마이페이지 쿠폰 조회
//	@RequestMapping("memberCouponList.me")
//	public String selectMemberCouponList(@RequestParam(value="cpage", defaultValue="1") 
//											int currentPage, 
//											int memberNo,
//											ModelAndView mv) {
//		//회원번호를 가지고 실적을 조회 해 온다조회한 실적을 기준으로 쿠폰 발급 가능 유무를 판정한다
//		PageInfo pi= Pagination.getPageInfo(myPageService.couponListCount(), currentPage, 5, 10);
//		
//		ArrayList<Coupon> cList = myPageService.memberCouponList(pi);
//		//System.out.println(cList);
//		//전월 실적 조회
////		HashMap<String, Object> map = new HashMap<>();		
//	int result = myPageService.paymentPerfomanceToProduct(memberNo) +  myPageService.paymentPerfomanceToReservation(memberNo);
////		if(!cList.isEmpty() && result != 0) {
////			map.put("cList", cList);
////			map.put("result", result);
////			map.put("pi", pi);
////		}
//		mv.addObject("cList", cList)
//		.addObject("pi", pi)
//		.addObject("result", result)
//		.setViewName("myPage/memberCouponList");
//		System.out.println(map.get("cList") +"  /  "+ map.get("result"));
//		
//		return  new Gson().toJson(map);
//		
//
//		
//	}
//	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
