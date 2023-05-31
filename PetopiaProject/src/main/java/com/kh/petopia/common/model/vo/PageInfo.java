package com.kh.petopia.common.model.vo;

import lombok.Data;

@Data
public class PageInfo {

	private int listCount;
	private int currentPage;
	private int boardLimit;
	private int pageLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
	
}
