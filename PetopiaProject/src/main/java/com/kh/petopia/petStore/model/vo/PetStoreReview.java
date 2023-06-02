package com.kh.petopia.petStore.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PetStoreReview {
	
	private int reviewNo;			// 리뷰번호
	private String employeeName;	// 근로자명
	private String nickName;		// 리뷰 작성자
	private String reviewContent;	// 리뷰 내용
	private Date createDate;		// 리뷰 작성일자
	private Date modifyDate;		// 리뷰 수정 일자
	private int rating;				// 평점
}
