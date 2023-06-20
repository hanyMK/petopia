package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.board.model.vo.Reply;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.member.model.vo.Pet;
import com.kh.petopia.myPage.model.dao.MyPageDao;
import com.kh.petopia.myPage.model.vo.AllReviews;
import com.kh.petopia.myPage.model.vo.Alram;
import com.kh.petopia.myPage.model.vo.Petpay;
import com.kh.petopia.myPage.model.vo.Point;
import com.kh.petopia.product.model.vo.ProductReceipt;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> myBoardList(int memberNo) {
		return myPageDao.myBoardList(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Alram> alramList(int memberNo) {
		return myPageDao.alramList(sqlSession, memberNo);
	}
	
	@Override
	public ArrayList<Board> alramReplyList(int memberNo) {
		return myPageDao.alramReplyList(sqlSession, memberNo);
	}
	
	@Override
	public ArrayList<ProductReceipt> alramShippingList(int memberNo) {
		return myPageDao.alramShippingList(sqlSession, memberNo);
	}
	
	@Override
	public ArrayList<Alram> alramNoticeList(int memberNo) {
		return myPageDao.alramNoticeList(sqlSession, memberNo);
	}
	
	@Override
	public ArrayList<Reply> myReplyList(int memberNo) {
		return myPageDao.myReplyList(sqlSession, memberNo);
	}
	
	@Override
	public Pet selectPet(int memberNo) {
		// SELECT 마이펫  -> VO는 memer밑에 있음
		return myPageDao.selectPet(sqlSession,memberNo);
	}

	@Override
	public int selectMemberCouponCount(int memberNo) {
		// 예약 결제 페이지에서 조회할 사용자의 쿠폰 개수
		return myPageDao.selectMemberCouponCount(sqlSession,memberNo);
	}

	@Override
	public ArrayList<Coupon> selectMemberCouponList(int memberNo) {
		// 예약 결제 페이지에서 조회할 사용자의 쿠폰 리스트
		return myPageDao.selectMemberCouponList(sqlSession,memberNo);
	}

	@Override
	public int selectMemberPoint(int memberNo) {
		return myPageDao.selectMemberPoint(sqlSession,memberNo);
	}
	
	@Override
	public int selectMemberPetPay(int memberNo) {
		return myPageDao.selectMemberPetPay(sqlSession,memberNo);
	}
	
	@Override
	public int selectPetPayCount(int memberNo) {
		return myPageDao.selectPetPayCount(sqlSession,memberNo);
	}

	@Override
	public int selectPointCount(int memberNo) {
		return myPageDao.selectPointCount(sqlSession,memberNo);
	}

	@Override
	public ArrayList<Petpay> myPetpayList(int memberNo) {
		return myPageDao.myPetpayList(sqlSession,memberNo);
	}
	
	@Override
	public String getMemberRating(int mno) {
		return myPageDao.getMemberRating(sqlSession, mno);
	}


	@Override
	public ArrayList<Point> myPointList(int memberNo) {
		return myPageDao.myPointList(sqlSession,memberNo);
	}

	@Override
	public int couponListCount() {
		return myPageDao.couponListCount(sqlSession);
	}

	@Override
	public ArrayList<Coupon> memberCouponList(PageInfo pi,  Member member) {
		return myPageDao.memberCouponList(sqlSession, pi, member);
	}
	
	@Override
	public int insertCouponToMember(Coupon coupon) {
		return myPageDao.insertCouponToMember(sqlSession, coupon);
	}
	
	@Override
	public ArrayList<Coupon> selectAvailableCoupon(int memberNo) {
		return myPageDao.selectAvailableCoupon(sqlSession, memberNo);
	}


	@Override
	public ArrayList<Petpay> petpayStatusList(HashMap<String, Object> map) {
		return myPageDao.petpayStatusList(sqlSession, map);
	}

	@Override
	public ArrayList<Point> pointStatusList(HashMap<String, Object> map) {
		return myPageDao.pointStatusList(sqlSession, map);
	}

	@Override
	public int insertChargePetpay(Petpay p) {
		return myPageDao.insertChargePetpay(sqlSession, p);
	}

	@Override
	public int insertWithdrawPetpay(Petpay p) {
		return myPageDao.insertWithdrawPetpay(sqlSession, p);
	}

	@Override
	public ArrayList<AllReviews> myReviewList(int memberNo) {
		return myPageDao.myReviewList(sqlSession,memberNo);
	}
	
	@Override
	public AllReviews productReviewForm(AllReviews r) {
		return myPageDao.productReviewForm(sqlSession,r);
	}

	@Override
	public ArrayList<AllReviews> reservationReviewForm(AllReviews r) {
		return myPageDao.reservationReviewForm(sqlSession,r);
	}	
	
	public int insertReview(AllReviews r) {
		int insert1 = myPageDao.insertReview(sqlSession,r);
		
		if(insert1 > 0) {
			if(r.getOriginName() != null) {
				return myPageDao.insertReview2(sqlSession, r);
			} else {
				return insert1;
			}
		} else {
			return insert1;
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 하은 마이페이지 시작
	@Override
	public int orderListCount(int memberNo) {
		return myPageDao.orderListCount(sqlSession,memberNo );
	}

	@Override
	public ArrayList<ProductReceipt> selectOrderList(int memberNo, PageInfo pi) {
		return myPageDao.selectOrderList(sqlSession, memberNo,pi);
	}

	@Override
	public int updateShippingStatus(int receiptNo) {
		return myPageDao.updateShippingStatus(sqlSession, receiptNo);
	}

	






	

}
