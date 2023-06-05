package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.member.model.vo.Pet;

public interface MyPageService {
	
	// 마이페이지 navi 게시글 조회
	ArrayList<Board> myBoardList(int memberNo);
	
	// SELECT 마이펫  -> VO는 memer밑에 있음
	Pet selectPet(int memberNo);
	
	
	

}
