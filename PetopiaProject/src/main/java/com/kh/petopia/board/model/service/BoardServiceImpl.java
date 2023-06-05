package com.kh.petopia.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.board.model.dao.BoardDao;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countBoard(String category) {
		return boardDao.countBoard(sqlSession, category);
	}

	@Override
	public ArrayList<Board> selectBoard(String category, PageInfo pi) {
		return boardDao.selectBoard(sqlSession, pi, category);
	}

	@Override
	public Board selectDetailBoard(int boardNo) {
		return boardDao.selectDetailBoard(sqlSession, boardNo);
	}

	@Override
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession, boardNo);
	}


}
