package com.kh.petopia.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petopia.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminservice;
	
	@RequestMapping("admin.ad")
	public String memberList(Model model) {
		
		return "admin/adminMemberList";
	}
	
	
	@RequestMapping("/admin/insertCouponList")
	public String delete() {
		return "admin/insertCouponList";
	}
	
}
