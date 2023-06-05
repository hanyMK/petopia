package com.kh.petopia.myPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.myPage.model.vo.AlramReply;
import com.kh.petopia.product.model.vo.ProductReceipt;

@Repository
public class MyPageDao {
	
	public ArrayList<Board> myBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myBoardList", memberNo);
	}

	public ArrayList<AlramReply> alramReplyList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramReplyList", memberNo);
	}

	public ArrayList<Board> alramNoticeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramNoticeList", memberNo);
	}

	public ArrayList<Coupon> alramCouponList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramCouponList", memberNo);
	}

	public ArrayList<ProductReceipt> alramShippingList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.alramShippingList", memberNo);
	}

}
