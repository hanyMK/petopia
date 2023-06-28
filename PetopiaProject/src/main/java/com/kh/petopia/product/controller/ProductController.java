package com.kh.petopia.product.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.kh.petopia.myPage.model.vo.Petpay;
import com.kh.petopia.product.model.service.ProductService;
import com.kh.petopia.product.model.vo.Cart;
import com.kh.petopia.product.model.vo.Product;
import com.kh.petopia.product.model.vo.ProductInfo;
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
	public ModelAndView productCartInfo(HttpSession session, ModelAndView mv, int result) {
		int memNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		int point = myPageService.selectMemberPoint(memNo);
		System.out.println(point);
		mv.addObject("list" ,productService.selectCartList(memNo)).addObject("point" , point).addObject("result", result).setViewName("product/productBuyPage");
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
	
	@ResponseBody
	@RequestMapping(value="calculate.pd", produces="application/json; charset=UTF-8")
	public String calculate(int total, String coupon, String point, ProductInfo pInfo) {
		System.out.println(total);
		System.out.println(coupon);
		System.out.println(point);
		
		int couponPrice = Integer.parseInt(coupon);
		int pointPrice = Integer.parseInt(point);
		double f = couponPrice;
		int value = 0;
		int extraMoney = 0;
		
		ArrayList<ProductInfo> list = new ArrayList();
		
		for(int i = 0; i < pInfo.getSize().length; i++) {
			ProductInfo p = new ProductInfo();
			p.setSizeEl(pInfo.getSize()[i]);
			
			list.add(p);
		}
		
		
		for(int i = 0; i > list.size(); i++) {
			if(list.get(i).getSizeEl().equals("M")) {
				extraMoney += 2000;
			}
			
			if(list.get(i).getSizeEl().equals("L")) {
				extraMoney += 4000;
			}
		}
		
		int exTotal = total + extraMoney;
		
		
		if(couponPrice == 0 && pointPrice == 0) {
			value = exTotal;
		} else if(couponPrice == 0) {
			value = exTotal - pointPrice;
		} else if(pointPrice == 0) {
			if(couponPrice >= 0 && couponPrice <= 100) {
				int cPrice = (int)(exTotal * (f/100));
				value = exTotal - cPrice;
			} else {
				value = exTotal - couponPrice;
			}
		} else {
			if(couponPrice >= 0 && couponPrice <= 100) {
				int cPrice = (int)(exTotal * (f/100));
				value = exTotal - cPrice - pointPrice;
			} else {
				value = exTotal - couponPrice - pointPrice;
			}
		}
		return new Gson().toJson(value);
	}
	
	@ResponseBody
	@RequestMapping(value="insertPetpay.pd", produces="application/json; charset=UTF-8")
	public String insertPetpay(Petpay p) {
		
		myPageService.insertChargePetpay(p);
		
		return new Gson().toJson("안녕");
	}
	
	@ResponseBody
	@RequestMapping(value="selectPetpay.pd", produces="application/json; charset=UTF-8")
	public String selectPetpay(HttpSession session) {
		int mno = ((Member)session.getAttribute("loginMember")).getMemberNo();
		int result = myPageService.selectMemberPetPay(mno);
		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="selectSearch.pd", produces="application/json; charset=UTF-8")
	public String selectSearch(String keyword) {
		return new Gson().toJson(productService.selectSearch(keyword));
	}
	
	@ResponseBody
	@RequestMapping(value="insertPayment.pd", produces="application/json; charset=UTF-8")
	public String insertPayment(ProductReceipt pr, ProductInfo pInfo) {
		if(pr.getCouponNo().equals("")) {
			pr.setCouponNo("0");
		}
		if(pr.getPoint().equals("")) {
			pr.setPoint("0");
		}
		
		Integer.parseInt(pr.getCouponNo());
		Integer.parseInt(pr.getPoint());
		
		int bonusPt = (int)(pr.getTotalPrice() * 0.05);
		
		pr.setBonusPt(bonusPt);
		//포인트랑 쿠폰이 리시티에 인설트가 되었을 경우에 해줘야함
		int[] resultArr = new int[11];
		
		// 인트형배열에 집어넣기
		System.out.println("---------------------------------");
		System.out.println(pr.getCouponNo());
		System.out.println(pr.getMemberNo());
		
		
		ArrayList<ProductInfo> list = new ArrayList();
		for(int i = 0; i < pInfo.getPno().length; i++) {
			ProductInfo p = new ProductInfo();
			p.setPnoEl(pInfo.getPno()[i]);
			p.setSizeEl(pInfo.getSize()[i]);
			p.setAmountEl(pInfo.getAmount()[i]);
			
			list.add(p);
		}
		
		
		HashMap hashCart = new HashMap();
		hashCart.put("memberNo", pr.getMemberNo());
		hashCart.put("list", list);
		
		if(pr.getPetPay() >= pr.getTotalPrice()) {
			resultArr[9] = productService.insertReceipt(pr, list, hashCart, resultArr);
		} 
		
		System.out.println("resultArr[9] : " + resultArr[9]);
		return new Gson().toJson(resultArr[9]);
	}
	
}
