package com.kh.petopia.myPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.member.model.vo.Pet;
import com.kh.petopia.board.model.vo.Reply;
import com.kh.petopia.myPage.model.vo.Alram;
import com.kh.petopia.myPage.model.vo.Petpay;
import com.kh.petopia.myPage.model.vo.Point;
import com.kh.petopia.product.model.vo.ProductReceipt;

@Repository
public class MyPageDao {
	
	public ArrayList<Board> myBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myBoardList", memberNo);
	}

	public ArrayList<Alram> alramList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramList", memberNo);
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
}
