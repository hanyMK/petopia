package com.kh.petopia.product.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String selectProductList(String category) {
		ArrayList<Product> list = productService.selectProductList(category);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="productDetailNavi.pd", produces="application/json; charset=UTF-8")
	public String productSelectDetail(String bno) {
		System.out.println(bno);
		Product product = productService.productSelectDetailPage(Integer.parseInt(bno));
		return new Gson().toJson(product);
	}
	
	
}
