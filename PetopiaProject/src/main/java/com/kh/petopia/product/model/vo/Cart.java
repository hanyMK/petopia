package com.kh.petopia.product.model.vo;

import lombok.Data;

@Data
public class Cart {
	
	private int memberNo; //MEMBER_NO	NUMBER
	private int productNo; //PRODUCT_NO	NUMBER
	private int amount; //AMOUNT	NUMBER
	private String productSize; //PRODUCT_SIZE	VARCHAR2(50 BYTE)
	private int cartNo;
	private String cartTitle;
	private int cartPrice;
	private int extraMoney;
	
}
