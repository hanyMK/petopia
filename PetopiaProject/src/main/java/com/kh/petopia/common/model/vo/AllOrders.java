package com.kh.petopia.common.model.vo;

import lombok.Data;

@Data
public class AllOrders {
	
	private int memberNo;
	private int productFinalPrice;
	private int amount;
	private String productTitle;
	private String shippingStatus;
	private String receiptDate;
	
}
