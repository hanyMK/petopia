package com.kh.petopia.reservation.model.service;

import java.util.ArrayList;

import com.kh.petopia.reservation.model.vo.Employee;
import com.kh.petopia.reservation.model.vo.Reservation;

public interface ReservationService {
	
	// 미용사 리스트 조회 
	ArrayList<Employee> selectEmployeeList(int psno);
	
	// 미용사의 예약 현황 조회 
	ArrayList<String> selectEmployeeReservation(Reservation r);

	// 결제 금액 조회
	int selectUsageFee(int psno);
	
}
