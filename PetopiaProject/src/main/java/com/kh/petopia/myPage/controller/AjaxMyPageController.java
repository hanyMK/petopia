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
	@RequestMapping(value="ajaxAlram.me", produces="application/json; charset=UTF-8")
	public String alramList(int mno) {
		return new Gson().toJson(myPageService.alramList(mno));
	}
	
	@ResponseBody
	@RequestMapping(value="alramShipping.me", produces="application/json; charset=UTF-8")
	public String alramShippingList(int mno) {
		return new Gson().toJson(myPageService.alramShippingList(mno));
	}
	
	@ResponseBody
	@RequestMapping(value="alramReply.me", produces="application/json; charset=UTF-8")
	public String alramReplyList(int mno) {
		return new Gson().toJson(myPageService.alramReplyList(mno));
	}
	
	@ResponseBody
	@RequestMapping(value="alramNotice.me", produces="application/json; charset=UTF-8")
	public String alramNoticeList(int mno) {
		return new Gson().toJson(myPageService.alramNoticeList(mno));
	}
	
	
	
}
