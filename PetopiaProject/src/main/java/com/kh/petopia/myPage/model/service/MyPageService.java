package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.board.model.vo.Reply;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.member.model.vo.Pet;
import com.kh.petopia.myPage.model.vo.AllReviews;
import com.kh.petopia.myPage.model.vo.Alram;
import com.kh.petopia.myPage.model.vo.Petpay;
import com.kh.petopia.myPage.model.vo.Point;
import com.kh.petopia.product.model.vo.ProductReceipt;

public interface MyPageService {
	
	// 마이페이지 navi 게시글 조회
	ArrayList<Board> myBoardList(int memberNo);
	
	// 알람 조회
	ArrayList<Alram> alramList(Member m);

	ArrayList<ProductReceipt> alramShippingList(int mno);
	
	ArrayList<Board> alramReplyList(int memberNo);
	
	ArrayList<Alram> alramNoticeList(int mno);
	
	// 알람 삭제
	int deleteShippingAlram(int delNo);
	
	int deleteReplyAlram(int delNo);

	int deleteQnaAlram(int delNo);
	
	int deleteCouponAlram(int delNo);
	
	// 마이페이지 - 게시글조회 - 댓글조회
	ArrayList<Reply> myReplyList(int mno);


	// SELECT 마이펫  -> VO는 memer밑에 있음
	Pet selectPet(int memberNo);
	
	// 예약 결제 페이지에서 조회할 사용자의 쿠폰 개수
	int selectMemberCouponCount(int memberNo);
	
	// 예약 결제 페이지에서 조회할 사용자의 쿠폰 리스트
	ArrayList<Coupon> selectMemberCouponList(int memberNo);
	
	// 현재 결제에서 사용가능한 사용자의 쿠폰 개수
	int selectAvaMemberCouponCount(HashMap<String, Integer> map);

	// 펫페이, 포인트 n건 조회
	// 예약 결제 페이지, 마이페이지 조회할 사용자의 포인트 
	int selectMemberPoint(int memberNo);

	int selectMemberPetPay(int mno);
	
	int selectPetPayCount(int mno);

	int selectPointCount(int mno);
	
	// 펫페이, 포인트 마이페이지 list
	ArrayList<Petpay> myPetpayList(int mno);
	
	ArrayList<Point> myPointList(int mno);
	
	//회원 등급 조회(총 결제 누적 금액 조회 후 앞단에서 등급 주기)
	//100만원 이상(>=) vip, 100만원 <gold <=50만원 / 50 <silver
	String getMemberRating(int mno);
	
	
	//회원이 발급 가능한 쿠폰 리스트 보여줌(페이징 처리 함께)
	//listCount
	int couponListCount();
	ArrayList<Coupon> memberCouponList(Member member);
	
	//회원 쿠폰 발급
	//만약 이미 발급 받은 쿠폰인 경우 목록에 표시 및 선택 불가능
	int insertCouponToMember(Coupon coupon);
	
	//사용완료, 사용가능, 사용기간 만료 쿠폰 리스트 조회
	ArrayList<Coupon> selectAvailableCoupon(int memberNo);

	ArrayList<Petpay> petpayStatusList(HashMap<String, Object> map);

	ArrayList<Point> pointStatusList(HashMap<String, Object> map);

	int insertChargePetpay(Petpay p);

	int insertWithdrawPetpay(Petpay p);

	ArrayList<AllReviews> myReviewList(int mno);
	
	AllReviews productReviewForm(AllReviews r);

	AllReviews reservationReviewForm(AllReviews r);
	
	int insertProductReview(AllReviews r);
	
	int insertReservationReview(AllReviews r);
	
	String selectMemberImage(int mno);

	int selectMemberReservationIng(int mno);

	int selectMemberReservationEnd(int mno);

	int selectMemberBoardCount(int mno);

	int selectMemberReplyCount(int mno);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 하은 마이페이지
	
	//주문 내역 페이징 처리를 위한 countList
	int orderListCount(int memberNo);
	ArrayList<ProductReceipt> selectOrderList(int memberNo, PageInfo pi);
	
	//배송상태 변경 메소드
	int updateShippingStatus(int receiptNo);
	
	ArrayList<ProductReceipt> selectDetailOrderList(int receiptNo);

	//회원 배송지 정보 변경
	
	int updateShippingInfo(ProductReceipt productReceipt);

	
	

}
