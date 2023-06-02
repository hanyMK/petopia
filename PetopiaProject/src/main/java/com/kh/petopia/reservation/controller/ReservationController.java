package com.kh.petopia.reservation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petopia.reservation.model.service.ReservationService;
import com.kh.petopia.reservation.model.vo.Employee;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;

	// 애견 미용 예약 step-1
	@RequestMapping("reservation1.ps")
	public ModelAndView reservationPetSalon(ModelAndView mv) {

		// 사용자가 강아지 미용예약하려고 예약버튼 클릭했삼 
		System.out.println("애견 미용실 예약하러 옴");
		
		// 1. 해당 미용실의 미용사 리스트를 조회해서 뿌려주기 
		// 참고로 미용실번호는 고정임 3번! 
		int psno = 3;
		
		ArrayList<Employee> eList = reservationService.selectEmployeeList(psno);
		
		mv.addObject("eList",eList);
		mv.setViewName("reservation/reservationPetSalon1");
		
		return mv;
	}
	
	// 애견 미용 예약 step-2
	
	
}
