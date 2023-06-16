package com.kh.petopia.myPage.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AllReviews {
	
	private int memberNo;
	private String title;
	private int receiptNo;
	private Date receiptDate;
	private int reservationNo;
	private int reviewProductNo;
	private int productNo;
	private int reviewNo;
	private String shippingStatus;
	private String checkInOut;
	private int finalPrice;

}
