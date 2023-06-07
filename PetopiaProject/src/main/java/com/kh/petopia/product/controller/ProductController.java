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
import com.kh.petopia.product.model.service.ProductService;
import com.kh.petopia.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="productManagement.pd")
	public String productManagement() {
		return "product/productManagementPage";
	}
	
	@RequestMapping(value="productInsert.pd")
	public String productInsertPage() {
		return "product/productInsertPage";
	}
	
	@RequestMapping(value="insert.pd")
	public String productInsert(Product p, Attachment atmt, MultipartFile upfile, HttpSession session) {
		
		System.out.println(session.getServletContext().getRealPath("/resource/uploadFiles/"));
		
		System.out.println(p);
		System.out.println(upfile);
		
		// 전달된 파일이 있을 경우 => 파일명 수정 후 서버에 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			atmt.setOriginName(upfile.getOriginalFilename());
			atmt.setChangeName("resources/uploadFiles/" + saveFile(upfile, session));
		}
		
		productService.insertProduct(p);
		
		return "product/productMain";
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resource/uploadFiles/");
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	
	
	
}
