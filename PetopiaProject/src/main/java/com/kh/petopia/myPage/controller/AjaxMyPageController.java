package com.kh.petopia.myPage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.common.template.Pagination;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.myPage.model.service.MyPageService;
import com.kh.petopia.product.model.vo.ProductReceipt;

@RestController
public class AjaxMyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	
	@RequestMapping(value="ajaxAlram.me", produces="application/json; charset=UTF-8")
	public String alramList( HttpSession session) {
		Member m = (Member)session.getAttribute("loginMember");
		return new Gson().toJson(myPageService.alramList(m));
	}
	
	
	@RequestMapping(value="alramShipping.me", produces="application/json; charset=UTF-8")
	public String alramShippingList(int mno) {
		return new Gson().toJson(myPageService.alramShippingList(mno));
	}
	

	@RequestMapping(value="alramReply.me", produces="application/json; charset=UTF-8")
	public String alramReplyList(int mno) {
		return new Gson().toJson(myPageService.alramReplyList(mno));
	}
	

	@RequestMapping(value="alramNotice.me", produces="application/json; charset=UTF-8")
	public String alramNoticeList(int mno) {
		return new Gson().toJson(myPageService.alramNoticeList(mno));
	}
	
	@RequestMapping(value="deleteAlram.me", produces="application/json; charset=UTF-8")
	public String deleteAlram(String category, int delNo) {
		System.out.println(category);
		System.out.println(delNo);
		
		HashMap<String, Object> map = new HashMap();
		map.put("category", category);
		map.put("delNo", delNo);
		
		System.out.println(map);
		
		return new Gson().toJson(myPageService.deleteAlram(map));
		
	}
	
	// 마이페이지 게시글 댓글 조회
	@RequestMapping(value="ajaxMyBoard.me", produces="application/json; charset=UTF-8")
	public String myBoardList(int mno) {
		return new Gson().toJson(myPageService.myBoardList(mno));
	}
	
	@RequestMapping(value="myReply.me", produces="application/json; charset=UTF-8")
	public String myReplyList(int mno) {
		return new Gson().toJson(myPageService.myReplyList(mno));
	}
	
	//마이페이지 쿠폰 조회
	@RequestMapping(value="couponList.me", produces="application/json; charset=UTF-8")
	public String selectMemberCouponList(HttpSession session) {
		//회원번호를 가지고 실적을 조회 해 온다조회한 실적을 기준으로 쿠폰 발급 가능 유무를 판정한다
		Member member = (Member)session.getAttribute("loginMember");
		ArrayList<Coupon> cList = myPageService.memberCouponList(member);
		System.out.println(cList);
		return  new Gson().toJson(cList);
		
		
	}
	// 쿠폰발급
	@RequestMapping("insertCoupon.me")
	public String insertCouponToMember(int memberNo, int couponNo) {
		Coupon coupon = new Coupon();
		coupon.setMemberNo(memberNo);
		coupon.setCouponNo(couponNo);
		return (myPageService.insertCouponToMember(coupon) > 0)? "YES" : "NO"; 
		
		
	}
	
	//회원등급에 따른 사용가능 쿠폰 조회
	@RequestMapping(value="availableCoupon.me", produces="application/json; charset=UTF-8")
	public String selectAvailableCoupon(int memberNo) {
		ArrayList<Coupon> list = myPageService.selectAvailableCoupon(memberNo);
		//System.out.println(list);
		
		return !list.isEmpty()?  new Gson().toJson(list): null;
	}
	
	
	
	
	
	
	
	//지성
	// 펫페이조회 전체, 충전, 인출
	@RequestMapping(value="petpayStatusList.me", produces="application/json; charset=UTF-8")
	public String petpayStatusList(String status, int mno) {
		System.out.println(status);
		
		HashMap<String, Object> map = new HashMap();
		map.put("status", status);
		map.put("memberNo", mno);
		
		System.out.println(map);
		
		System.out.println(myPageService.petpayStatusList(map));
		
		return new Gson().toJson(myPageService.petpayStatusList(map));
	}
	
	// 포인트 조회 전체, 충전, 인출
	@RequestMapping(value="pointStatusList.me", produces="application/json; charset=UTF-8")
	public String pointStatusList(String status, int mno) {
		System.out.println(status);
		
		HashMap<String, Object> map = new HashMap();
		map.put("status", status);
		map.put("memberNo", mno);
		
		System.out.println(map);
		
		System.out.println(myPageService.pointStatusList(map));
		
		return new Gson().toJson(myPageService.pointStatusList(map));
	}
	
	// 리뷰 조회
	// 작성 가능한 리뷰 조회
	@RequestMapping(value="ajaxMyReviewList.me", produces="application/json; charset=UTF-8")
	public String myReviewList(int mno) {
		return new Gson().toJson(myPageService.myReviewList(mno));
	}
	
	 
	@RequestMapping(value="myReviewEndList.me", produces="application/json; charset=UTF-8")
	public String myReviewEndList(int mno) {
		return new Gson().toJson(myPageService.myReviewList(mno));
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//---- 하은
	// 회원 주문 배송 내역 조회 매소드
	@RequestMapping(value="selectOrderList.me", produces="apllication/json; charset=UTF-8")
	public String selectOrderList(int memberNo, 
								@RequestParam(value="currentPage", defaultValue="1" )int currentPage) {
		
		PageInfo pi = Pagination.getPageInfo(myPageService.orderListCount(memberNo),currentPage, 10, 10);
		ArrayList<ProductReceipt> list = myPageService.selectOrderList(memberNo, pi);
		HashMap<String, Object> receiptList = new HashMap<>(); 
		
		if(!list.isEmpty()) {
			receiptList.put("pi", pi);
			receiptList.put("list", list);
		}
		
		return  new Gson().toJson(receiptList);
	}
	
	
	//구매확정 버튼 클릭시 상품 상태 변경 메소드
	@PostMapping("updateShippingStatus.me")
	public String updateShippingStatus(int receiptNo) {
		return myPageService.updateShippingStatus(receiptNo) > 0?  "Secesse" :"Fail";
	}
	

	
	
	
	
	
	
	
	
	
	
}
