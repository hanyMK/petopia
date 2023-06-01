package com.kh.petopia.product.model.vo;

import java.sql.Date;

public class Ask {
	
	private int productAskNo; //PRODUCT_ASK_NO	NUMBER
	private int productNo; //PRODUCT_NO	NUMBER
	private String askWriter; //ASK_WRITER	VARCHAR2(50 BYTE)
	private String askContent; //ASK_CONTENT VARCHAR2(1000 BYTE)
	private Date askDate; //ASK_DATE DATE
}
