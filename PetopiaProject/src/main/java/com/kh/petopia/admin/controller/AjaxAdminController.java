package com.kh.petopia.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.petopia.admin.model.service.AdminService;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.common.template.Pagination;
import com.kh.petopia.member.model.vo.Member;

@RestController
@Controller
public class AjaxAdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping(value="ajaxMemberList.ad", produces="application/json; charset=UTF-8")
	public String selectMemberList(@RequestParam(value="cPage", defaultValue="1") int currentPage) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.memberListCount(), currentPage, 10, 5);
		ArrayList<Member> list = new ArrayList(adminService.memberList(pi));
		HashMap<String, Object> hashMap = new HashMap();
		hashMap.put("pi",pi);
		hashMap.put("list", list);
		return new Gson().toJson(hashMap);
	}
	

	
}
