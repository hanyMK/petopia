package com.kh.petopia.myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class MyPageDao {
	
	public ArrayList<Board> myBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myBoardList", memberNo);
	}

	public ArrayList<Alram> alramList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramList", m);
	}
	
	public ArrayList<ProductReceipt> alramShippingList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramShippingList", memberNo);
	}
	
	public ArrayList<Board> alramReplyList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramReplyList", memberNo);
	}

	public ArrayList<Alram> alramNoticeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramNoticeList", memberNo);
	}
	
	public int deleteShippingAlram(SqlSessionTemplate sqlSession, int delNo) {
		return sqlSession.update("myPageMapper.deleteShippingAlram", delNo);
	}
	
	public int deleteReplyAlram(SqlSessionTemplate sqlSession, int delNo) {
		return sqlSession.update("myPageMapper.deleteReplyAlram", delNo);
	}
	
	public int deleteQnaAlram(SqlSessionTemplate sqlSession, int delNo) {
		return sqlSession.update("myPageMapper.deleteQnaAlram", delNo);
	}
	
	public int deleteCouponAlram(SqlSessionTemplate sqlSession, int delNo) {
		return sqlSession.update("myPageMapper.deleteCouponAlram", delNo);
	}
	
	public ArrayList<Reply> myReplyList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myReplyList", memberNo);
	}


	public Pet selectPet(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectPet", memberNo);
	}
	
	public ArrayList<Coupon> selectMemberCouponList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMemberCouponList", memberNo);
	}

	public int selectMemberCouponCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMemberCouponCount", memberNo);
	}

	public int selectMemberPoint(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMemberPoint", memberNo);
	}
	
	public int selectMemberPetPay(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMemberPetPay", memberNo);
	}

	public int selectPetPayCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectPetPayCount", memberNo);
	}

	public int selectPointCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectPointCount", memberNo);
	}

	public ArrayList<Petpay> myPetpayList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myPetpayList", memberNo);
	}

	public ArrayList<Point> myPointList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myPointList", memberNo);
	}
	
	public String getMemberRating(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("myPageMapper.getMemberRating", mno);
	}
	
	public int couponListCount(SqlSessionTemplate sqlSession){
		return sqlSession.selectOne("myPageMapper.couponListCount");
	}
	
	public ArrayList<Coupon> memberCouponList(SqlSessionTemplate sqlSession, Member member){
		
		return  (ArrayList)sqlSession.selectList("myPageMapper.memberCouponList",member);
	}
	
	public int insertCouponToMember(SqlSessionTemplate sqlSession, Coupon coupon) {
		return sqlSession.insert("myPageMapper.insertCouponToMember", coupon);
	}

	public ArrayList<Coupon> selectAvailableCoupon(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectAvailableCoupon", memberNo);
	}
	


	public ArrayList<Petpay> petpayStatusList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("myPageMapper.petpayStatusList", map);
	}
	

	public ArrayList<Point> pointStatusList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("myPageMapper.pointStatusList", map);
	}
	
	public ArrayList<AllReviews> myReviewList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myReviewList", memberNo);
	}

	public int insertChargePetpay(SqlSessionTemplate sqlSession, Petpay p) {
		return sqlSession.insert("myPageMapper.insertChargePetpay", p);
	}
	
	public int insertWithdrawPetpay(SqlSessionTemplate sqlSession, Petpay p) {
		return sqlSession.insert("myPageMapper.insertWithdrawPetpay", p);
	}
	
	public AllReviews productReviewForm(SqlSessionTemplate sqlSession,AllReviews r) {
		return sqlSession.selectOne("myPageMapper.productReviewForm", r);
	}

	public AllReviews reservationReviewForm(SqlSessionTemplate sqlSession, AllReviews r) {
		return sqlSession.selectOne("myPageMapper.reservationReviewForm", r);
	}
	
	public int insertProductReview(SqlSessionTemplate sqlSession, AllReviews r) {
		return sqlSession.insert("myPageMapper.insertProductReview", r);
	}
	
	public int insertProductReview2(SqlSessionTemplate sqlSession, AllReviews r) {
		return sqlSession.insert("myPageMapper.insertProductReview2", r);
	}
	
	public int insertReservationReview(SqlSessionTemplate sqlSession, AllReviews r) {
		return sqlSession.insert("myPageMapper.insertReservationReview", r);
	}

	public int insertReservationReview2(SqlSessionTemplate sqlSession, AllReviews r) {
		return sqlSession.insert("myPageMapper.insertReservationReview2", r);
	}
	
	public int insertReviewPoint(SqlSessionTemplate sqlSession, Point p) {
		return sqlSession.insert("myPageMapper.insertReviewPoint", p);
	}

	public String selectMemberImage(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMemberImage", memberNo);
	}

	public int selectMemberReservationIng(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMemberReservationIng", memberNo);
	}

	public int selectMemberReservationEnd(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMemberReservationEnd", memberNo);
	}

	public int selectMemberBoardCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMemberBoardCount", memberNo);
	}

	public int selectMemberReplyCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMemberReplyCount", memberNo);
	}
	
	public Pet selectMyPet(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectMyPet", memberNo);
	}
	
	public int insertMyPet(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.insert("myPageMapper.insertMyPet", p);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 하은 마이페이지 시작
	public int orderListCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.orderListCount", memberNo);
	}
	
	public ArrayList<ProductReceipt> selectOrderList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi){
	
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		return (ArrayList)sqlSession.selectList("myPageMapper.selectOrderList",
												 memberNo,
												 new RowBounds(offset, pi.getBoardLimit()));
	}
	
	public int updateShippingStatus(SqlSessionTemplate sqlSession, int receiptNo) {
		return sqlSession.update("myPageMapper.updateShippingStatus", receiptNo);
	}
	
	public ArrayList<ProductReceipt> selectDetailOrderList(SqlSessionTemplate sqlSession, int receiptNo){
		return (ArrayList)sqlSession.selectList("myPageMapper.selectDetailOrderList", receiptNo);
	}

	// 현재 결제에서 필요한 쿠폰 개수
	public int selectAvaMemberCouponCount(SqlSessionTemplate sqlSession,HashMap <String, Integer> map) {
		return sqlSession.selectOne("myPageMapper.selectAvaMemberCouponCount",map);
	}

	public int updateShippingInfo(SqlSessionTemplate sqlSession, ProductReceipt productReceipt) {
		return sqlSession.update("myPageMapper.updateShippingInfo", productReceipt);
	}

	


	

	

	
	
}
