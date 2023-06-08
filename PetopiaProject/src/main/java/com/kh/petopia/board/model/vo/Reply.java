package com.kh.petopia.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	
	private int replyNo; //REPLY_NO	NUMBER
	private int boardNo; //BOARD_NO	NUMBER
	private int memberNo;
	private String nickname;
	private String replyContent; //REPLY_CONTENT	VARCHAR2(4000 BYTE)
	private int replyLike; //REPLY_LIKE	NUMBER
	private Date createDate; //CREATE_DATE	DATE
	
	// 마이페이지 사용
	private String boardTitle;
	private String category;

}
