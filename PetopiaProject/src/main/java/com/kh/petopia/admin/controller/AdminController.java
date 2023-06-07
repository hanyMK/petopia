package com.kh.petopia.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petopia.admin.model.service.AdminService;
import com.kh.petopia.admin.model.vo.Coupon;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminservice;
	
	@RequestMapping("managerPage.ma")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping("admin.ad")
	public String memberList(Model model) {
		
		return "admin/adminMemberList"; 
	}
	

	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//----------------------하은--------------------
	
	
	
	@RequestMapping("couponList.manager")
	public String coponListShow() {
		return "admin/couponList";
	}
	
	//관리자 쿠폰 발급
	@RequestMapping("insertCoupon.ad")
	public ModelAndView insertCouponToAdmin(Coupon c, ModelAndView mv) {
		System.out.println(c);
		
		if(adminservice.insertCoupon(c)> 0) {
			mv.addObject("alertMsg", "쿠폰이 발급되었습니다")
			.setViewName("redirect:admin/couponList");
		}else {
			mv.addObject("errorMsg", "쿠폰발급이 실패했습니다")
			.setViewName("errorPage");
		}
		return mv;
	}
	
	
	
	
	
	
}
