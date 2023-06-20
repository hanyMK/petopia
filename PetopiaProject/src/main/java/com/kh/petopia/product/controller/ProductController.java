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
import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.common.template.MyFileRename;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.myPage.model.service.MyPageService;
import com.kh.petopia.myPage.model.vo.Point;
import com.kh.petopia.product.model.service.ProductService;
import com.kh.petopia.product.model.vo.Cart;
import com.kh.petopia.product.model.vo.Product;
import com.kh.petopia.product.model.vo.ProductReceipt;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MyPageService myPageService;
	
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
		
		Attachment atmtThumbnail = new Attachment();
		Attachment atmtDetail = new Attachment();
		
		atmtThumbnail.setOriginName(thumbnail.getOriginalFilename());
		atmtThumbnail.setChangeName(MyFileRename.saveFile(session, thumbnail));
		atmtThumbnail.setFilePath(filePath);
		
		atmtDetail.setOriginName(detail.getOriginalFilename());
		atmtDetail.setChangeName(MyFileRename.saveFile(session, detail));
		atmtDetail.setFilePath(filePath);
		
		productService.insertProduct(p, atmtThumbnail, atmtDetail);
		
		System.out.println("insert문임"+p);
		
		return "redirect:product.pd";
	}
	
	@RequestMapping(value="detail.pd")
	public ModelAndView productSelectDetail(String bno, ModelAndView mv) {
		mv.addObject("p",productService.productSelectDetail(Integer.parseInt(bno))).setViewName("product/productDetailEnrollForm");
		mv.addObject("bno", bno);
		ArrayList<Product> list = productService.productSelectSize(Integer.parseInt(bno));
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
	public ModelAndView productSelectCart(HttpSession session, ModelAndView mv) {
		Member user = (Member)session.getAttribute("loginMember");
		int memNo = user.getMemberNo();
		System.out.println(memNo);
		
		ArrayList<Cart> list = productService.selectCartList(memNo);
		int result = 0;
		for(int i = 0; i < list.size(); i++) {
			
			result += list.get(i).getCartPrice() + list.get(i).getExtraMoney();
		}
		mv.addObject("list", list).addObject("result", result).setViewName("product/productCartPage");
		return mv;
	}
	
	@RequestMapping("prdocutCartInfo.pd")
	public ModelAndView productCartInfo(HttpSession session, ModelAndView mv) {
		
		int memNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		int point = myPageService.selectMemberPoint(memNo);
		System.out.println(point);
		if(point > 0) {
			mv.addObject("list" ,productService.selectCartList(memNo)).addObject("point" , point).setViewName("product/productBuyPage");
		} else {
			mv.addObject("list" ,productService.selectCartList(memNo)).setViewName("product/productBuyPage");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="payInfo.pd", produces="application/json; charset=UTF-8")
	public String payInfo(int result) {
		System.out.println(result);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="selectCoupon.pd", produces="application/json; charset=UTF-8")
	public String selectCoupon(int memNo) {
		ArrayList<Coupon> list = productService.selectCoupon(memNo);
		System.out.println("쿠폰" + list);
		if(list.isEmpty()) {
			return new Gson().toJson(" ");
		} else {
			return new Gson().toJson(list);
		}
	}
	
}
