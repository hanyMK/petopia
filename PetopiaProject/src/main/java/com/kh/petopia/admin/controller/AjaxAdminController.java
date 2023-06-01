package com.kh.petopia.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.petopia.admin.model.service.AdminService;

@RestController
@Controller
public class AjaxAdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping("ajaxMemberList.ad")
	public String selectMemberList(@RequestParam(value="cPage", defaultValue="1") int currentPage) {
		
		adminService.memberListCount();
		return "list";
	}
	
}
