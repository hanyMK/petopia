package com.kh.petopia.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.petopia.myPage.model.service.MyPageService;

public class AjaxMyPageController {
	
	@Autowired
	private MyPageService myPageService;

}
