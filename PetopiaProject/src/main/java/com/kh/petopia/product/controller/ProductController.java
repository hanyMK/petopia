package com.kh.petopia.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petopia.product.model.service.ProductService;

@Controller
public class ProductController {
	
//	@Autowired
//	private ProductService productService;
	
	@RequestMapping(value="product.pd")
	public String selectProductList() {
		
		return "product/productMain";
	}
	
}
