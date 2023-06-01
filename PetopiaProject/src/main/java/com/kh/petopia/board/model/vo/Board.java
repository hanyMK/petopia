package com.kh.petopia.board.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	
	private int boardNo;
	private int memberNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private String category;
	private int boardLike;



}
