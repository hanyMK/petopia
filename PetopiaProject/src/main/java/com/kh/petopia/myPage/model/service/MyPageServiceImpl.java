package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.board.model.vo.Reply;
import com.kh.petopia.myPage.model.dao.MyPageDao;
import com.kh.petopia.myPage.model.vo.Alram;
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
	


}
