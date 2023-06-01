package com.kh.petopia.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petopia.board.model.service.BoardService;

@Controller
public class BoardController {
/*
	@Autowired
	private BoardService boardService;
*/
	@RequestMapping("board.bo")
	public String selectBoardList() {
		
		return "board/mainBoard";
	}
	
	
}
