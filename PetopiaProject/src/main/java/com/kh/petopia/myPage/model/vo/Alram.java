package com.kh.petopia.myPage.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Alram {
	//b.category, b.create_date, b.board_title, r.nickname, r.reply_content
	
	// 전체 알림
	private String columnAll;
	private Date dateAll;
	
	private String category;
	private String title;
	private String nickname;
	private String replyContent;
	
	// 공지사항
	private String qnaYn;
	private String couponName;
	
	// 전체 PK
	private int primaryNo;
	
	private int replyNo;
}
