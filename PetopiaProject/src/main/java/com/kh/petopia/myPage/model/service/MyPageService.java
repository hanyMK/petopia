package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.myPage.model.vo.Alram;
import com.kh.petopia.product.model.vo.ProductReceipt;

public interface MyPageService {
	
	// 마이페이지 navi 게시글 조회
	ArrayList<Board> myBoardList(int memberNo);
	
	ArrayList<Alram> alramList(int memberNo);

	ArrayList<ProductReceipt> alramShippingList(int mno);
	
	ArrayList<Board> alramReplyList(int memberNo);
	
	ArrayList<Alram> alramNoticeList(int mno);


}
