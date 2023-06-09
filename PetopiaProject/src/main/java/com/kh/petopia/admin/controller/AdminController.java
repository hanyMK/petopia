package com.kh.petopia.admin.controller;

import java.util.ArrayList;
import java.util.Date;

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
	
	@RequestMapping("adminPage.ad")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping("memberList.ad")
	public String memberList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		//PageInfo pi = Pagination.getPageInfo(adminService.memberListCount(), currentPage, 10 , 5);
		// model.addAttribute("pi",pi);
		return "admin/adminMemberList"; 
	}
	
	@RequestMapping("adminSales.ad")
	public String adminSales(Model model) {
		Date now = new Date();
		int month = now.getMonth()+1;
		
		int store = adminService.salesCheck();
		System.out.println(store);
		model.addAttribute("month", month);
		model.addAttribute("store",store);
		return "admin/adminSales";
	}
	


	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//----------------------하은--------------------
	
	
	

	
	//관리자 쿠폰 발급
	@RequestMapping("insertCoupon.ad")
	public ModelAndView insertCouponToAdmin(Coupon c, ModelAndView mv) {
		System.out.println(c);
		
		if(adminService.insertCoupon(c)> 0) {
			mv.addObject("alertMsg", "쿠폰이 발급되었습니다")
			.setViewName("redirect:/couponList.admin");
		}else {
			mv.addObject("errorMsg", "쿠폰발급이 실패했습니다")
			.setViewName("errorPage");
		}
		return mv;
	}
	
	/**
	 * 관리자 관점 쿠폰 리스트 조회
	 * @param currentPage : 페이징 처리를 위한 현재 페이지 번호
	 * @return
	 */
	@RequestMapping("couponList.admin")
	public ModelAndView coponListShow(@RequestParam(value="cpage", defaultValue="1") int currentPage,
								ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(adminService.adminCouponListCount(), currentPage, 10, 10);
		ArrayList<Coupon> couponList = adminService.adminCouponList(pi);
		System.out.println(couponList);
		System.out.println(pi);
		if(!couponList.isEmpty()) {
			mv.addObject("pi", pi)
			.addObject("couponList",couponList )
			.setViewName("admin/couponList");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
}
