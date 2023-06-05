package com.kh.petopia.myPage.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AlramReply {
	//b.category, b.create_date, b.board_title, r.nickname, r.reply_content
	
	private String category;
	private Date createDate;
	private String boardTitle;
	private String nickname;
	private String replyContent;
	
}
