package com.kh.petopia.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.petopia.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	
}
