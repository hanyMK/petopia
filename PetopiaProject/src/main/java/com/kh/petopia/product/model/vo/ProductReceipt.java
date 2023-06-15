package com.kh.petopia.product.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductReceipt {
	
	private int receiptNo; //	NUMBER
	private int memberNo; //MEMBER_NO	NUMBER
	private Date receiptDate; //RECEIPT_DATE	DATE
	private int couponNo; //COUPON_NO	NUMBER
	private int point; //POINT	NUMBER
	private int shippingNo; //OSHIPPING_NO	NUMBER
	private String productTitle;
	
	private String shippingStatus; // 배송상태 .......
	
	private int receipNo; //RECEIPT_NO	NUMBER
	private int productNo; //PRODUCT_NO	NUMBER
	private int amount; //AMOUNT	NUMBER
	private int resultPrice; //쿠폰, 포인트 적용 후 최종 결제 금액
	
	private String productSize; // PRODUCT_SIZE	CHAR(1 BYTE)
	private String status; //STATUS	CHAR(1 BYTE)
	private int extraMoney; //추가금
	private String filePath; //파일 경로
	

}
