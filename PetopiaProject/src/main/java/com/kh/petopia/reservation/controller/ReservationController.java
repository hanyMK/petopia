package com.kh.petopia.reservation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		mv.addObject("eList", eList);
		mv.addObject("pet", pet);
		
		mv.setViewName("reservation/reservationPetSalon");
		
		return mv;
	}
	
	// 애견 미용 예약 step-2
	@RequestMapping("payment.ps")
	public ModelAndView paymentPetSalon(Reservation r, HttpSession session, ModelAndView mv) {
		
		Member loginMember = (Member)(session.getAttribute("loginMember"));
		
		System.out.println(loginMember);
		
		r.setPetStoreNo(3);
		r.setMemberNo(loginMember.getMemberNo());
		
		System.out.println(r);
		
		// 화면에 출력해줘야할 정보 
		
		// 1. 사용자가 입력한 날짜 및 시간 
		// r.getCheckIn(), r.getReservationTime()
		
		// 2. 사용자의 마이펫 정보 -> 사용자의 마이펫이 있을 수도있고 
		
		// 3. 사용자가 가지고있는 쿠폰이랑 적립금도 가져와야돼 
		
		// 4. 총 예약금액은 마이펫의 나이랑 무게에 따라서 달라져 그러면은 마이펫 정보를  이 페이지에서 선택하지 말고 이전 페이지에서 선택하도록 설정 
		// -> 이전 페이지에서 
		
		
		
		
		mv.addObject("reservation",r);
		mv.setViewName("reservation/paymentPetSalon");
		
		return mv;
	}
	
	
}
