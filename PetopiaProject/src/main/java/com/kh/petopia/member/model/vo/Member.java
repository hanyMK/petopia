package com.kh.petopia.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private int memberNo;
	
	private String email;
	private String memberPwd;
	private String nickname;
	private String memberName;
	private String birthday;
	private String phone;
	private String bank;
	private String account;
	private String address;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	
	

}
