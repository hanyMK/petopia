package com.kh.petopia.admin.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SelectShipping {
	
	private int receiptNo;
	private String memberName;
	private String receiptDate;
	private int amount;
	private String productTitle;
}
