package com.kh.petopia.board.model.vo;


import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	
	private int boardNo;
	private int memberNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private String category;
	private int boardLike;
	private int boardCount;
	private String qnaYN;
	
	private int replyCount;
	private String nickName;
	private String originName;
	private String changeName;
	private String filePath;


}
