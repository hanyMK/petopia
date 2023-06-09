package com.kh.petopia.board.controller;

import java.io.File;
import java.util.ArrayList;
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
import com.kh.petopia.board.model.vo.Reply;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.common.template.MyFileRename;
import com.kh.petopia.common.template.Pagination;
import com.kh.petopia.member.model.vo.Member;

@Controller
public class BoardController {
	
	private String filePath = "resources/uploadFiles/";
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("board.bo")
	public String mainBoard(String category, @RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.countBoard(category), currentPage, 5 , 10);
		model.addAttribute("category", category);
		model.addAttribute("pi", pi);
		System.out.println(category);
		
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
	
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b,
									MultipartFile upfile,
									HttpSession session,
									Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			
			
			
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName(MyFileRename.saveFile(session, upfile));
			b.setFilePath(filePath);
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
	 
	@RequestMapping("updateForm.bo")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		mv.addObject("b", boardService.selectDetailBoard(bno)).setViewName("board/boardUpdateForm");
		return mv;
	}
	
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, MultipartFile reUpfile, HttpSession session) {
		
		if(!reUpfile.getOriginalFilename().equals("")) {
			
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			
			String changeName = MyFileRename.saveFile(session, reUpfile);
			
			b.setOriginName(reUpfile.getOriginalFilename());
			b.setChangeName(changeName);
			b.setFilePath(filePath);
		}
		
		if(boardService.updateBoard(b) > 0) {
			session.setAttribute("alertMsg", "게시글 수정 성공!");
			return "redirect:detail.bo?bno=" + b.getBoardNo();
		} else {
			session.setAttribute("errorMsg", "게시글 수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		return new Gson().toJson(boardService.selectReply(bno));
	}
	
	@ResponseBody
	@RequestMapping(value="replyInsert.bo", produces="application/json; charset=UTF-8")
	public String ajaxInsertReply(Reply r, HttpSession session) {
	
		int memNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		r.setMemberNo(memNo);
		
		return new Gson().toJson(boardService.insertReply(r));
	}
	
	
}
