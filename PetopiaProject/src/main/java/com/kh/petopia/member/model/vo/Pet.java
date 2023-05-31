package com.kh.petopia.member.model.vo;

import lombok.Data;

@Data
public class Pet {
	
	
	private int memberNo;//MEMBER_NO	NUMBER
	private String gender;//GENDER	CHAR(2 BYTE)
	private String species;//SPECIES	VARCHAR2(200 BYTE)
	private String petName;//PET_NAME	VARCHAR2(100 BYTE)
	private int age;//AGE	NUMBER
	private double weight;//WEIGHT	NUMBER
	private String isPet;

}