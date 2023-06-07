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

}
