package com.kh.petopia.product.model.vo;

import lombok.Data;

@Data
public class ProductInfo {
	
	private int[] pno;
	private int[] amount;
	private String[] size;
	
	private int memberNo;
	private int pnoEl;
	private int amountEl;
	private String sizeEl;

}
