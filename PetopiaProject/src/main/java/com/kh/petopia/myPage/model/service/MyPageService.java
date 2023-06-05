package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.member.model.vo.Pet;
import com.kh.petopia.myPage.model.vo.AlramReply;
import com.kh.petopia.product.model.vo.ProductReceipt;

public interface MyPageService {
	
	// 마이페이지 navi 게시글 조회
	ArrayList<Board> myBoardList(int memberNo);
	
	
	
	
	ArrayList<AlramReply> alramReplyList(int memberNo);

	ArrayList<Board> alramNoticeList(int mno);

	ArrayList<Coupon> alramCouponList(int mno);

	ArrayList<ProductReceipt> alramShippingList(int mno);

	// SELECT 마이펫  -> VO는 memer밑에 있음
	Pet selectPet(int memberNo);
}
