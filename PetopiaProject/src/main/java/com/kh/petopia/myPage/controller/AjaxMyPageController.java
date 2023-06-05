package com.kh.petopia.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.petopia.myPage.model.service.MyPageService;

public class AjaxMyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@ResponseBody
	@RequestMapping(value="ajaxAlramReply.me", produces="application/json; charset=UTF-8")
	public String AjaxalramReplyList(int mno) { // ajax selectReplyList()에서 bno로 넘겨줬으면 bno로 받기
		return new Gson().toJson(myPageService.alramReplyList(mno));
	}
	
}
