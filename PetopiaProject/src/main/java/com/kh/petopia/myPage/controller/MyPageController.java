package com.kh.petopia.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petopia.common.template.MyFileRename;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.member.model.vo.Pet;
import com.kh.petopia.myPage.model.service.MyPageService;
import com.kh.petopia.myPage.model.vo.AllReviews;
import com.kh.petopia.myPage.model.vo.Petpay;
import com.kh.petopia.myPage.model.vo.Point;
import com.kh.petopia.product.model.vo.ProductReceipt;

@Controller
public class MyPageController {

	private String filePath = "resources/uploadFiles/";
	
	@Autowired
	private MyPageService myPageService;
	
	
	// 헤더 마이페이지 클릭
	@RequestMapping("myPage.me")
	public ModelAndView myPage(int mno, ModelAndView mv) {
		//프로필 이미지 조회
		mv.addObject("image", myPageService.selectMemberImage(mno));
		System.out.println(myPageService.selectMemberImage(mno));
		
		// 전체 페이 금액 조회
		mv.addObject("petpay", myPageService.selectMemberPetPay(mno));
		
		// 전체 포인트 조회
		mv.addObject("point", myPageService.selectMemberPoint(mno));
		
		// 총 쿠폰 개수
		mv.addObject("coupon", myPageService.selectMemberCouponCount(mno));
		
		// 예약 내역
		// 오늘 날짜 기준으로 진행중인 예약 개수 조회
		mv.addObject("rIng", myPageService.selectMemberReservationIng(mno));
		// 오늘 날짜 기준으로 끝난 예약 개수 조회
		mv.addObject("rEnd", myPageService.selectMemberReservationEnd(mno));
		
		// 게시글 개수
		mv.addObject("board", myPageService.selectMemberBoardCount(mno));
		
		// 댓글 개수
		mv.addObject("reply", myPageService.selectMemberReplyCount(mno));
		
		// 회원 등급 조회
		mv.addObject("rating", myPageService.getMemberRating(mno));
		
		// jsp로 보내주기
		mv.setViewName("myPage/myPage");
		
		return mv;
	}
	
	// 마이페이지 게시글 조회
	@RequestMapping("myBoard.me")
	public String myBoardList() {
		//model.addAttribute("list", myPageService.myBoardList(mno));
		return "myPage/myBoardList";
	}
	
	// 알람 iframe페이지
	@RequestMapping("alram.me")
	public String alramList() {
		return "myPage/alramList";
	}
	
	// 페이 iframe페이지
	@RequestMapping("pay.me")
	public ModelAndView payList(ModelAndView mv, HttpSession session) {
		Member member = (Member)session.getAttribute("loginMember");
		mv.addObject("petpayAmount", myPageService.selectMemberPetPay(member.getMemberNo())).setViewName("myPage/payList");
		return mv;
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
	
	
	// 마이페이지 -> 쿠폰조회
	@RequestMapping("memberCouponList.me")
	public String memberCouponListView() {
		return "myPage/memberCouponList";
	}
	
	// 마이페이지 펫페이 충전
	@RequestMapping("insertChargePetpay.me")
	public String insertChargePetpay(Petpay p, HttpSession session, Model model) {
		if(myPageService.insertChargePetpay(p) > 0) {
			session.setAttribute("alertMsg", "펫페이 충전 완료!");
			return "redirect:myPetpayPoint.me?mno=" + p.getMemberNo();
		} else {
			model.addAttribute("errorMsg", "펫페이 충전 실패");
			return "common/errorPage";
		}
	}
	
	// 마이페이지 펫페이 인출
	@RequestMapping("insertWithdrawPetpay.me")
	public String insertWithdrawPetpay(Petpay p, HttpSession session, Model model) {
		if(myPageService.insertWithdrawPetpay(p) > 0) {
			session.setAttribute("alertMsg", "펫페이 인출 완료!");
			return "redirect:myPetpayPoint.me?mno=" + p.getMemberNo();
		} else {
			model.addAttribute("errorMsg", "펫페이 충전 실패");
			return "common/errorPage";
		}
	}
	
	// 리뷰 조회 페이지
	@RequestMapping("myReview.me")
	public String myReviewList() {
		return "myPage/myReviewList";
	}
	
	// 상품 리뷰 작성 페이지
	@RequestMapping("productReviewForm.me")
	public String productReviewForm(AllReviews r, Model model) {
		System.out.println("상품 :  " + r);
		System.out.println(myPageService.productReviewForm(r));
		model.addAttribute("review", myPageService.productReviewForm(r));
		return "myPage/myReviewInsert";
	}
	
	// 예약 리뷰 작성 페이지
	@RequestMapping("reservationReviewForm.me")
	public String reservationReviewForm(AllReviews r, Model model) {
		System.out.println("예약 : " + r);
		model.addAttribute("review", myPageService.reservationReviewForm(r));
		return "myPage/myReviewInsert";
	}
	
	// 리뷰 작성 INSERT
	@RequestMapping("insertReview.me")
	public String insertReview(AllReviews r,
				               MultipartFile upfile,
							   HttpSession session,
							   Model model ) {
		
		System.out.println("작성 : " + r);
		
		// 사진 첨부 시
		if(!upfile.getOriginalFilename().equals("")) {
			r.setOriginName(upfile.getOriginalFilename());
			r.setChangeName(MyFileRename.saveFile(session, upfile));
			r.setFilePath(filePath);
		}
		
		if(r.getProductNo() != 0) {
			// 상품 리뷰 작성
			if(myPageService.insertProductReview(r) > 0) {
				session.setAttribute("alertMsg", "리뷰 등록 성공!!");
				
				Point p = new Point();
				p.setMemberNo(r.getMemberNo());
				
				// 포인트 적립
				if(upfile.getOriginalFilename().equals("")) {
					p.setPointAmount(500);
					myPageService.insertReviewPoint(p);
				} else {
					p.setPointAmount(1000);
					myPageService.insertReviewPoint(p);
				}
				
				return "redirect:myReview.me";
			} else {
				model.addAttribute("errorMsg", "게시글 등록 실패 ㅠ");
				return "common/errorPage";
			}
		} else {
			// 예약 리뷰 작성
			if(myPageService.insertReservationReview(r) > 0) {
				session.setAttribute("alertMsg", "리뷰 등록 성공!!");
				
				Point p = new Point();
				p.setMemberNo(r.getMemberNo());
				
				// 포인트 적립
				if(upfile.getOriginalFilename().equals("")) {
					p.setPointAmount(500);
					myPageService.insertReviewPoint(p);
				} else {
					p.setPointAmount(1000);
					myPageService.insertReviewPoint(p);
				}
				
				return "redirect:myReview.me";
			} else {
				model.addAttribute("errorMsg", "게시글 등록 실패 ㅠ");
				return "common/errorPage";
			}
		}
		
	}
	
	// 마이페이지 펫정보 수정, 조회
	@RequestMapping("myPet.me")
	public String myPetList(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("loginMember");
		int mno = member.getMemberNo();
		System.out.println(myPageService.selectMyPet(mno));
		model.addAttribute("pet", myPageService.selectMyPet(mno));
		return "myPage/myPetList";
	}
	
	@RequestMapping("insertMyPet.me")
	public String insertPet(Pet p, Model model) {
		System.out.println(p);
		model.addAttribute("myPet", myPageService.insertMyPet(p));
		return "myPage/myPetList";
	}
	
	
	



	
//------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("orderList.me")
	public String selectOrderList() {
		return "myPage/myOrderList";
	}
	
	//회원 배송, 주문 내역 디테일 조회
	@GetMapping("orderDetail.me")
	public ModelAndView selectDetailOrderList(int receiptNo, ModelAndView mv) {

		ArrayList<ProductReceipt> orderList = myPageService.selectDetailOrderList(receiptNo);
		System.out.println(orderList);
		mv.addObject("order", orderList)
		.setViewName("myPage/myOrderDetail");
		return mv;
	}
	
	//배송지 설정 변경
	@RequestMapping("updateSippingInfo.me")
	public String updateSippingInfo(ProductReceipt productReceipt,
									HttpSession session) {
		System.out.println("오나?");
		System.out.println(productReceipt);
		if(myPageService.updateShippingInfo(productReceipt)> 0) session.setAttribute("alertMsg", "배송지 정보가 수정되었습니다");
		else session.setAttribute("alertMsg", "배송지 정보 수정에 실패했습니다.");
	
		return "redirect:orderDetail.me?receiptNo="+ productReceipt.getReceiptNo();
	}
	
	
	

	
}
