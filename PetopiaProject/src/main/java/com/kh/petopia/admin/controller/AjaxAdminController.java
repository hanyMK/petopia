package com.kh.petopia.admin.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.petopia.admin.model.service.AdminService;
import com.kh.petopia.admin.model.vo.SelectShipping;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.common.template.Pagination;

@RestController
public class AjaxAdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "ajaxMemberList.ad", produces = "application/json; charset=UTF-8")
	public String selectMemberList(int currentPage) {
		PageInfo pi = Pagination.getPageInfo(adminService.memberListCount(), currentPage, 10, 5);
		HashMap<String, Object> result = new HashMap();
		result.put("pi", pi);
		result.put("list", adminService.memberList(pi));
		return new Gson().toJson(result);
	}

	@RequestMapping(value = "ajaxMemberSearch.ad", produces = "application/json; charset=UTF-8")
	public String memberSearch(String searchType, String keyword,
			@RequestParam(value = "cPage", defaultValue = "1") int currentPage) {

		Map<String, Object> params = new HashMap<>();
		params.put("searchType", searchType);
		params.put("keyword", keyword);
		PageInfo pi = Pagination.getPageInfo(adminService.memberSearchCount(params), currentPage, 10, 5);
		params.put("pi", pi);
		HashMap<String, Object> result = new HashMap();
		result.put("pi", pi);
		result.put("list", adminService.memberSearch(params));
		return new Gson().toJson(result);
	}

	@RequestMapping(value = "ajaxShippingList.ad", produces = "application/json; charset=UTF-8")
	public String ShippingList(int currentPage) {
		
		ArrayList<SelectShipping> oList = adminService.ShippingList();
		ArrayList<SelectShipping> nList = new ArrayList<>();

	        // 중복된 receiptNo를 처리하기 위한 맵
	        Map<Integer, SelectShipping> receiptNoMap = new HashMap<>();
	        
	        for (SelectShipping item : oList) {
	            int receiptNo = item.getReceiptNo();
	            if (!receiptNoMap.containsKey(receiptNo)) {
	                // receiptNo가 맵에 없는 경우, 새로운 아이템을 맵에 추가
	            	item.setProductTitle(item.getProductTitle() + "(" + item.getAmount() + "개)"); 
	                receiptNoMap.put(receiptNo, item);
	            } else {
	                // receiptNo가 이미 맵에 있는 경우, 기존 아이템을 가져옴
	                SelectShipping existingItem = receiptNoMap.get(receiptNo);

	                // amount를 합산
	                int newAmount = existingItem.getAmount() + item.getAmount();
	                existingItem.setAmount(newAmount);

	                // productTitle을 문자열로 합침
	                String existingProductTitle = existingItem.getProductTitle();
	                String newProductTitle = existingProductTitle + ", " + item.getProductTitle() + item.getProductTitle() + "(" + item.getAmount() + "개)";
	               
	                
	                // 글자가 40을 넘으면 앞의 상품까지만 글자 자르기
	                if(newProductTitle.length() > 40) {
	                	existingProductTitle = existingProductTitle.replace("...", "");
	                	newProductTitle = existingProductTitle + "...";
	                }	
	                existingItem.setProductTitle(newProductTitle);
	            }
	        }

	        // 맵의 값들을 새로운 리스트에 추가
	        nList.addAll(receiptNoMap.values());
	        
	        // receiptNo로 정렬
	        Collections.sort(nList, Comparator.comparingInt(SelectShipping::getReceiptNo));
	        
			PageInfo pi = Pagination.getPageInfo(nList.size(), currentPage, 10, 5);
			
			// int totalPayment = adminService.toalPayment();
			// sql문짜고 다시 작성 !!!!!!!!!!!!!!!!!
			
			
			int stp = (currentPage-1)*10;
			int edp = (currentPage*10);
			
			if(edp>nList.size()) {
				edp = nList.size();
			}
			
					
			HashMap<String, Object> result = new HashMap();
			
			result.put("pi", pi);
			result.put("list", nList);
			result.put("stp",stp);
			result.put("edp",edp);
			
			
			return new Gson().toJson(result);

		}
}
