package com.kh.petopia.myPage.model.vo;

import lombok.Data;

@Data
public class Point {
	
	private int pointNo; //POINT_NO	NUMBER
	private int pointAmount; //POINT_AMOUNT	NUMBER
	private String pointHistoty; //POINT_HISTORY	VARCHAR2(20 BYTE)
	private String pointDate; //POINT_DATE	DATE
	private String pointStatus; //POINT_STATUS	CHAR(3 BYTE)
	private int memberNo; //MEMBER_NO	NUMBER
}
