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

	// 결제 테이블 insert
	int insertReservation(Reservation r);

	// 결제 완료 후 데이터 저장
	Reservation selectCompleteReservation();

	int selectReservationNo();
	
	// 결제 리싶트테이블 insert
	// int insertReservationReceipt(Reservation r);
	
	/*
	// 결제시 사용한 펫페이 
	int insertMinusPetPay(Reservation r);
	
	// 적립금 사용 
	int insertMinusPoint(Reservation r);
	
	// 쿠폰 변경
	int updateCouponStatus(Reservation r);
	
	// 결제시 결제 금액의 5% 적립
	int insertPlusPoint(Reservation r);
	*/
}
