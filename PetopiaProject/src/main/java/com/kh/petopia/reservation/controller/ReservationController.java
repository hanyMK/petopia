package com.kh.petopia.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.member.model.vo.Pet;
import com.kh.petopia.myPage.model.service.MyPageService;
import com.kh.petopia.reservation.model.service.ReservationService;
import com.kh.petopia.reservation.model.vo.Employee;
import com.kh.petopia.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private MyPageService myPageService;

	// 애견 미용 예약 step-1
	@RequestMapping("reservation.ps")
	public ModelAndView reservationPetSalon(ModelAndView mv, HttpSession session) {

		// 1. 해당 미용실의 미용사 리스트를 조회해서 뿌려주기 
		// 참고로 미용실번호는 고정임 3번
		int psno = 3;
		
		ArrayList<Employee> eList = reservationService.selectEmployeeList(psno);
		System.out.println(eList);
		
		// 2. 로그인한 사용자의 마이펫 조회  myPageService
		Member loginMember = (Member)(session.getAttribute("loginMember"));
		Pet pet = myPageService.selectPet(loginMember.getMemberNo());
		System.out.println(pet);
		
		// 3. 미용 예약의 기본 금액 조회 
		
		mv.addObject("eList", eList);
		mv.addObject("pet", pet);
		
		mv.setViewName("reservation/reservationPetSalon");
		
		return mv;
	}
	
	// 사용자가 선택한 미용사의 예약 현황 조회 메소드
	@ResponseBody
	@RequestMapping(value="selectEmployeeReservation.ps", produces="application/json; charset=UTF-8")
	public String ajaxSelectEmployeeReservation(Reservation r, HttpSession session) {
		
		System.out.println("사용자가 선택한 미용사 번호 : " + r.getEmployeeNo());
		System.out.println("사용자가 입력한 예약 일자" + r.getCheckIn());
		
		
		System.out.println(reservationService.selectEmployeeReservation(r));
		
		
		return new Gson().toJson(reservationService.selectEmployeeReservation(r));
	}
	
	
	// 애견 미용 예약 step-2
	@RequestMapping("payment.ps")
	public ModelAndView paymentPetSalon(Reservation r, HttpSession session, ModelAndView mv) {
		
		Member loginMember = (Member)(session.getAttribute("loginMember"));
		int memberNo = loginMember.getMemberNo();
		
		r.setPetStoreNo(3);			// 사용자가 예약할 서비스는 미용 서비스
		r.setMemberNo(memberNo);	// 예약 사용자
		
		// 응답해줄 화면에 출력해야할 정보
		
		// 1. 선택한 미용사 / 예약 날짜 / 시간 
		// => 사용자로부터 입력 받은 후 Reservation 객체에 값 저장되어있음 
		int usageFee = reservationService.selectUsageFee(3);
		r.setReservationFee(usageFee);
		System.out.println(usageFee);
		
		// 2. 예약하려는 사용자의 마이펫 정보 
		Pet pet = myPageService.selectPet(memberNo);

		// 3. 예약자 및 연락처 => 로그인 세션에 저장되어있음
		
		// 4.쿠폰 조회
		
		// 4-1. 쿠폰 조회
		int couponCount = myPageService.selectMemberCouponCount(memberNo);			// 보유한 쿠폰 개수
		ArrayList<Coupon> cList = myPageService.selectMemberCouponList(memberNo);	// 보유한 쿠폰 리스트
		
		// 4-2. 현재 사용 가능한 쿠폰 개수
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("usageFee", usageFee);
		int avaCouponCount = myPageService.selectAvaMemberCouponCount(map);	
		
		// 5. 적립금 조회 
		int point = myPageService.selectMemberPoint(memberNo);
		
		// 6. 결제 정보 출력
		// 사용자의 입력에 따른 예약금액 
		// 사용자가 선택한 쿠폰과 적립금에 따른 총 결제 금액 
		
		// 7. 보유 펫페이 출력
		int petPay = myPageService.selectMemberPetPay(memberNo);
		
		System.out.println(r);
		System.out.println(cList);
		
		mv.addObject("r",r);						// 예약 정보
		mv.addObject("pet",pet);					// 펫 정보
		mv.addObject("couponCount",couponCount);	// 보유한 쿠폰 개수
		mv.addObject("avaCouponCount",avaCouponCount);
		mv.addObject("cList",cList);				// 사용자가 갖고있는 쿠폰 리스트 
		mv.addObject("point",point);				// 적립금 
		mv.addObject("petPay",petPay);
		
		mv.setViewName("reservation/paymentPetSalon");
		return mv;
	}
	


	
	
}
