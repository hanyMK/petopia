package com.kh.petopia.myPage.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AllReviews {
	
	private int memberNo;
	private int finalPrice;
	private String checkInOut;
	private String details;
	private String title;
	private String shippingStatus;
	private Date receiptDate;
	private int reviewNo;
	private int productNo;
	private int reservationNo;

//	MEMBER_NO
//	FINAL_PRICE
//	CHECK_IN_OUT
//	DETAILS
//	TITLE
//	SHIPPING_STATUS
//	RECEIPT_DATE
//	REVIEW_NO
}
