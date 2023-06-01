package com.kh.petopia.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petopia.admin.model.service.AdminService;

@Controller
public class AdminController {

	
	@RequestMapping("admin.ad")
	public String memberList() {
		return "admin/adminMemberList";
	}
}
