package com.kh.petopia.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.common.template.MyFileRename;
import com.kh.petopia.product.model.service.ProductService;
import com.kh.petopia.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	private String filePath ="resources/uploadFiles/";
	
	@RequestMapping(value="product.pd")
	public String productMain() {
		
		return "product/productMain";
	}
	
	@RequestMapping(value="productManagement.pd")
	public String productManagement() {
		return "product/productManagementPage";
	}
	
	@RequestMapping(value="productInsert.pd")
	public String productInsertPage() {
		return "product/productInsertPage";
	}
	
	@RequestMapping(value="insert.pd")
	public String productInsert(String category, 
			                    Product p, 
			                    Attachment atmt, 
			                    MultipartFile thumbnail,
			                    MultipartFile detail,
			                    HttpSession session) {
		
		p.setCategoryName(category);
		
		System.out.println(category);
		System.out.println(p);
		System.out.println(thumbnail);
		System.out.println(detail);
		
		Attachment atmtThumbnail = new Attachment();
		Attachment atmtDetail = new Attachment();
		
		atmtThumbnail.setOriginName(thumbnail.getOriginalFilename());
		atmtThumbnail.setChangeName(MyFileRename.saveFile(session, thumbnail));
		atmtThumbnail.setFilePath(filePath);
		
		atmtDetail.setOriginName(detail.getOriginalFilename());
		atmtDetail.setChangeName(MyFileRename.saveFile(session, detail));
		atmtDetail.setFilePath(filePath);
		
		productService.insertProduct(p, atmtThumbnail, atmtDetail);
		
		return "product/productMain";
	}
	
}
