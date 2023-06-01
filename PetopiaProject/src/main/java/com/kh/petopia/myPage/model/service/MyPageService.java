package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.board.model.vo.Reply;

public interface MyPageService {
	
	ArrayList<Board> myBoardList(int memberNo);
	
	ArrayList<Reply> myReplyList(int memberNo);
	

}
