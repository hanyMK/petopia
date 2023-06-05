package com.kh.petopia.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.petopia.myPage.model.service.MyPageService;

@Controller
public class AjaxMyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@ResponseBody
	@RequestMapping(value="ajaxAlramReply.me", produces="application/json; charset=UTF-8")
	public String alramReplyList(int mno) {
		return new Gson().toJson(myPageService.alramReplyList(mno));
	}
	
	@ResponseBody
	@RequestMapping(value="alramNotice.me", produces="application/json; charset=UTF-8")
	public String alramNoticeList(int mno) {
		return new Gson().toJson(myPageService.alramNoticeList(mno));
	}
	
	@ResponseBody
	@RequestMapping(value="alramCoupon.me", produces="application/json; charset=UTF-8")
	public String alramCouponList(int mno) {
		System.out.println(mno);
		System.out.println(new Gson().toJson(myPageService.alramCouponList(mno)));
		return new Gson().toJson(myPageService.alramCouponList(mno));
	}
	
	@ResponseBody
	@RequestMapping(value="alramShipping.me", produces="application/json; charset=UTF-8")
	public String alramShippingList(int mno) {
		return new Gson().toJson(myPageService.alramShippingList(mno));
	}
	
	
	
}
