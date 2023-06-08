package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.board.model.vo.Reply;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.member.model.vo.Pet;
import com.kh.petopia.myPage.model.vo.Alram;
import com.kh.petopia.myPage.model.vo.Petpay;
import com.kh.petopia.myPage.model.vo.Point;
import com.kh.petopia.product.model.vo.ProductReceipt;

public interface MyPageService {
	
	// 마이페이지 navi 게시글 조회
	ArrayList<Board> myBoardList(int memberNo);
	
	// 알람 조회
	ArrayList<Alram> alramList(int memberNo);

	ArrayList<ProductReceipt> alramShippingList(int mno);
	
	ArrayList<Board> alramReplyList(int memberNo);
	
	ArrayList<Alram> alramNoticeList(int mno);
	
	// 마이페이지 - 게시글조회 - 댓글조회
	ArrayList<Reply> myReplyList(int mno);


	// SELECT 마이펫  -> VO는 memer밑에 있음
	Pet selectPet(int memberNo);
	
	// 예약 결제 페이지에서 조회할 사용자의 쿠폰 개수
	int selectMemberCouponCount(int memberNo);
	
	// 예약 결제 페이지에서 조회할 사용자의 쿠폰 리스트
	ArrayList<Coupon> selectMemberCouponList(int memberNo);

	// 펫페이, 포인트 n건 조회
	// 예약 결제 페이지, 마이페이지 조회할 사용자의 포인트 
	int selectMemberPoint(int memberNo);

	int selectMemberPetPay(int mno);
	
	int selectPetPayCount(int mno);

	int selectPointCount(int mno);
	
	// 펫페이, 포인트 마이페이지 list
	ArrayList<Petpay> myPetpayList(int mno);
	
	ArrayList<Point> myPointList(int mno);
	
	
	//회원이 발급 가능한 쿠폰 리스트 보여줌(페이징 처리 함께)
	//listCount
	int CouponListCount();
	ArrayList<Coupon> memberCouponList(PageInfo pi);

	

	

}
