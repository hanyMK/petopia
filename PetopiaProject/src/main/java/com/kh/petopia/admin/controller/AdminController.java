package com.kh.petopia.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petopia.admin.model.service.AdminService;
import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.common.template.Pagination;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("managerPage.ma")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping("admin.ad")
	public String memberList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(adminService.memberListCount(), currentPage, 10 , 5);
		model.addAttribute("pi",pi);
		System.out.println("여기는 처음"+ pi);
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
		
		if(adminService.insertCoupon(c)> 0) {
			mv.addObject("alertMsg", "쿠폰이 발급되었습니다")
			.setViewName("redirect:admin/couponList");
		}else {
			mv.addObject("errorMsg", "쿠폰발급이 실패했습니다")
			.setViewName("errorPage");
		}
		return mv;
	}
	
	
	
	
	
	
}
