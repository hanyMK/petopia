package com.kh.petopia.product.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Product {
	
	private int productNo; //PRODUCT_NO	NUMBER
	private String productStatus; //PRODUCT_STATUS	CHAR(1 BYTE)
	private String productTitle; //PRODUCT_TITLE	VARCHAR2(100 BYTE)
	private int productPrice; //PRODUCT_PRICE	NUMBER
	private Date productDate; //PRODUCT_DATE	DATE
	private String categoryName; //CATEGORY_NAME	VARCHAR2(50 BYTE)
	
	private String originName;
	private String changeName;
	private String filePath;

}
