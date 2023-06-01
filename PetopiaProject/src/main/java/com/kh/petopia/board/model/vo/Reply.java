package com.kh.petopia.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	
	private int replyNo; //REPLY_NO	NUMBER
	private int boardNo; //BOARD_NO	NUMBER
	private String replyWriter; //REPLY_WRITER	VARCHAR2(50 BYTE)
	private String replyContent; //REPLY_CONTENT	VARCHAR2(4000 BYTE)
	private int replyLike; //REPLY_LIKE	NUMBER
	private Date createDate; //CREATE_DATE	DATE

}
