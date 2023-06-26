package com.kh.petopia.reservation.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
	
	int reservationNo;		// RESERVATION_NO	NUMBER
	int petStoreNo;			// PET_STORE	NUMBER
	int memberNo;			// MEMBER_NO	NUMBER
	Date checkIn;			// CHECK_IN	DATE
	Date checkOut;		// CHECK_OUT	DATE
	String reservationTime;	// RESERVATION_TIME	VARCHAR2(20 BYTE)
	int reservationFee;		// RESERVATION_FEE	NUMBER
	int employeeNo;			// EMPLOYEE	NUMBER
	
	//
	String employeeName;
	String petStoreName;
	String memberName;	
	
	//
	String reservationName;		// 예약자명
	String reservationPhone;	// 예약자 연락처
	
	// INSERT RESERVATION_RECEIPT 테이블
	int couponNo;	// 결제 시 사용한 쿠폰
	int point;		// 결제 시 사용한 적립금

}
