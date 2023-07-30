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

	private String reviewContent;
	private Date createDate;
	private Date modifyDate;
	private int rating;
	
	private String nickName;
	private String originName;
	private String changeName;
	private String filePath;
}
