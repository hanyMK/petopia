package com.kh.petopia.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.myPage.model.dao.MyPageDao;

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


}
