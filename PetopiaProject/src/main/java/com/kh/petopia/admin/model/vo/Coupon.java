package com.kh.petopia.admin.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Coupon {
	
	private int couponNo; //COUPON_NO	NUMBER
	private String couponName; //COUPON_NAME	VARCHAR2(1000 BYTE)
	private int couponType; //COUPON_TYPE	NUMBER
	private int discount; // DISCOUNT	NUMBER
	private String startDate; //START_DATE	DATE
	private String endDate; //END_DATE	DATE
	private int maxPrice; //MAX_PRICE	NUMBER
	private int minPrice; //MIN_PRICE	NUMBER
	
	private int memberNo;

}
