package com.kh.petopia.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	public String mainBoard(String category, @RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.countBoard(category), currentPage, 5 , 10);
		model.addAttribute("category", category);
		model.addAttribute("pi", pi);
		
		return "board/mainBoard";
	}
	
	@ResponseBody
	@RequestMapping(value="list.bo", produces="application/json; charset=UTF-8")
	public String selectBoardList(int currentPage, String category) {
		PageInfo pi = Pagination.getPageInfo(boardService.countBoard(category), currentPage, 5 , 10);
		ArrayList<Board> list = boardService.selectBoard(category, pi);
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("pi", pi);
		hashMap.put("list", list);
		
		return new Gson().toJson(hashMap);
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(ModelAndView mv, int bno) {
		if(boardService.increaseCount(bno) > 0) {
			mv.addObject("b", boardService.selectDetailBoard(bno)).setViewName("board/boardDetail");
		} else {
			mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	public String saveFile(MultipartFile upfile,
							HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("YYYYMMDDHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b,
									MultipartFile upfile,
									HttpSession session,
									Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			
			
			
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName(saveFile(upfile, session));
			b.setFilePath("resources/uploadFiles/");
		}
		
		if(boardService.insertBoard(b) > 0) {
			session.setAttribute("alertMsg", "게시글 등록 성공!!");
			return "redirect:board.bo?category=ALL";
		} else {
			model.addAttribute("errorMsg", "게시글 등록 실패 ㅠ");
			return "common/errorPage";
		}
		
	}

	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, String file, HttpSession session) {
		
		if(boardService.deleteBoard(bno) > 0) {
			if(!file.equals("")) {
				new File(session.getServletContext().getRealPath(file)).delete();
			
			}
			session.setAttribute("alertMsg", "삭제 성공~");
			return "redirect:board.bo?category=ALL";
		} else {
			session.setAttribute("errorMsg", "삭제 실패..ㅠ");
			return "common/errorPage";
		}
		
		
	}
	 
	@RequestMapping("update.bo")
	public String updateBoard(int bno, String file, HttpSession session) {
		
		return "";
	}
	
}
