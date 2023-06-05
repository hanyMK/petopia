package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.myPage.model.vo.AlramReply;

public interface MyPageService {
	
	// 마이페이지 navi 게시글 조회
	ArrayList<Board> myBoardList(int memberNo);
	
	ArrayList<AlramReply> alramReplyList(int memberNo);
	
	
	

}
