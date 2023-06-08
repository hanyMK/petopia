package com.kh.petopia.product.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.product.model.service.ProductService;
import com.kh.petopia.product.model.vo.Product;

@Controller
public class AjaxProductController {
	
	@Autowired
	private ProductService productService;
	
	@ResponseBody
	@RequestMapping(value="productAjax.pd", produces="application/json; charset=UTF-8")
	public String selectProductList() {
		
		ArrayList<Product> list = productService.selectProductList();
		ArrayList<Attachment> listImg = productService.selectProductImg();
		
		HashMap<String, Object> result = new HashMap();
		
		result.put("list", list);
		result.put("listImg", listImg);
		
		System.out.println(list);
		System.out.println(listImg);
		System.out.println(result);
		
		return new Gson().toJson(result);
	}
	
}
