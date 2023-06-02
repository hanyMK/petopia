package com.kh.petopia.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
public class PageInfo {

	private int listCount;
	private int currentPage;
	private int boardLimit;
	private int pageLimit;

	private int maxPage;
	private int startPage;
	private int endPage;
	
	
}
