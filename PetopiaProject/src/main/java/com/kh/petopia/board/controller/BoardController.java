package com.kh.petopia.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.petopia.board.model.service.BoardService;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("board.bo")
	public String mainBoard() {
		
		return "board/mainBoard";
	}
	
	@ResponseBody
	@RequestMapping(value="list.bo", produces="application/json; charset=UTF-8")
	public String selectBoardList(@RequestParam(value="cpage=", defaultValue="1")
									int currentPage, String category) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.countBoard(category), currentPage, 5 , 10);
		
		ArrayList<Board> list = boardService.selectBoard(category, pi);
		
		HashMap<String, Object> hashMap = new HashMap();
		hashMap.put("pi", pi);
		hashMap.put("list", list);
		
		return new Gson().toJson(hashMap);
	}
	
}
