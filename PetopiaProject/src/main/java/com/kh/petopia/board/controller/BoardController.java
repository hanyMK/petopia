package com.kh.petopia.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
/*
	@Autowired
	private BoardService boardService;
*/
	@RequestMapping("board.bo")
	public String mainBoard() {
		
		return "board/mainBoard";
	}
	
	@RequestMapping("list.bo")
	public String selectBoardList(@RequestParam(value="cpage=", defaultValue="1") int currentPage, String category) {
		
		
		return "";
	}
	
}
