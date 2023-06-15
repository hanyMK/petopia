package com.kh.petopia.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.common.template.MyFileRename;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.product.model.service.ProductService;
import com.kh.petopia.product.model.vo.Cart;
import com.kh.petopia.product.model.vo.Product;
import com.kh.petopia.product.model.vo.ProductReceipt;

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
		
		System.out.println(p);
		p.setCategoryName(category);
		
		Attachment atmtThumbnail = new Attachment();
		Attachment atmtDetail = new Attachment();
		
		atmtThumbnail.setOriginName(thumbnail.getOriginalFilename());
		atmtThumbnail.setChangeName(MyFileRename.saveFile(session, thumbnail));
		atmtThumbnail.setFilePath(filePath);
		
		atmtDetail.setOriginName(detail.getOriginalFilename());
		atmtDetail.setChangeName(MyFileRename.saveFile(session, detail));
		atmtDetail.setFilePath(filePath);
		
		productService.insertProduct(p, atmtThumbnail, atmtDetail);
		
		return "redirect:product.pd";
	}
	
	@RequestMapping(value="detail.pd")
	public ModelAndView productSelectDetail(String bno, ModelAndView mv) {
		mv.addObject("p",productService.productSelectDetail(Integer.parseInt(bno))).setViewName("product/productDetailEnrollForm");
		mv.addObject("bno", bno);
		ArrayList<Product> list = productService.productSelectSize(Integer.parseInt(bno));
		System.out.println(list);
		if(list.size() > 0) {
			mv.addObject("list", list).setViewName("product/productDetailEnrollForm");
		}
		return mv;
	}
	
	@RequestMapping(value="buyPage.pd")
	public ModelAndView productBuyInsert(ProductReceipt pr, ModelAndView mv) {
		mv.addObject("pr", pr).setViewName("product/productBuyPage");
		return mv;
	}
	
	@RequestMapping("productInfo.pd")
	public String productInfo(int pno, HttpSession session) {
		
		Cart mem = (Cart)session.getAttribute("loginMember");
		
		System.out.println(mem);
		
//		ArrayList<Product> list = productService.productSelectSize(pno);
//		productService.selectProductInfo(pno);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="insertCart.pd", produces="application/json; charset=UTF-8")
	public String insertCart(Cart cart) {
		int num = productService.insertCart(cart);
		return new Gson().toJson(num);
	}
	
	@RequestMapping(value="productCart.pd")
	public String productSelectCart(HttpSession session) {
		Member user = (Member)session.getAttribute("loginMember");
		int memNo = user.getMemberNo();
		productService.selectCartList(memNo);
		
		return "product/productCartPage";
	}
	
	
}
