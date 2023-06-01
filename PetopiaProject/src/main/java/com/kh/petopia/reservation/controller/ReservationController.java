package com.kh.petopia.reservation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petopia.reservation.model.service.ReservationService;
import com.kh.petopia.reservation.model.vo.Employee;
import com.kh.petopia.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;

	// 애견 미용 예약
	@RequestMapping("reservation.ps")
	public String reservationPetSalon() {
		System.out.println("애견 미용실 예약하러 옴");
		
		// 사용자가 미용 예약 페이지 왔을 때 
		
		// 1. 해당 미용실의 미용사 리스트를 조회해서 뿌려주기 
		
		// 미용실번호는 고정임 3번! 
		
		int psno = 3;
		
		ArrayList<Employee> list = reservationService.selectEmployeeList(psno);
		
		System.out.println(list);
		
		
		
		
		return null;
		
	}
}
