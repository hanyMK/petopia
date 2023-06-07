package com.kh.petopia.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public String selectMemberList(int currentPage) {
		PageInfo pi = Pagination.getPageInfo(adminService.memberListCount(), currentPage, 10, 5);
		ArrayList<Member> list = adminService.memberList(pi);
		HashMap<String, Object> result = new HashMap();
		result.put("pi",pi);
		result.put("list", list);
		return new Gson().toJson(result);
	}
	
	
	@RequestMapping(value="ajaxMemberSearch.ad", produces="application/json; charset=UTF-8")
	public String memberSearch(String searchType, String keyword,@RequestParam(value="cpage", defaultValue="1") int currentPage) {
		Map<String, Object> params = new HashMap<>();
		params.put("searchType", searchType);
		params.put("keyword", keyword);
		PageInfo pi = Pagination.getPageInfo(adminService.memberSearchCount(params), currentPage, 10, 5);
		HashMap<String, Object>  result = new HashMap();
		result.put("pi", pi);
		result.put("list",adminService.memberSearch(params, pi));
		return new Gson().toJson(result);
		
	}
}










