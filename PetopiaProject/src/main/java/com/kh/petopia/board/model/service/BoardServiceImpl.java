package com.kh.petopia.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.board.model.dao.BoardDao;
import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.board.model.vo.Reply;
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

	@Override
	public int insertBoard(Board b) {
		int insert1 = boardDao.insertBoard(sqlSession, b);
		
		if(insert1 > 0) {
			if(b.getOriginName() != null) {
				return boardDao.insertBoard2(sqlSession, b);
			} else {
				return insert1;
			}
		} else {
			return insert1;
		}
		
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Board b) {
		
		int update1 = boardDao.updateBoard(sqlSession, b);
		
		if(update1 > 0) {
			if(b.getOriginName() != null) {
				int update2 = boardDao.updateBoard2(sqlSession, b);
				
				if(update2 == 0) {
					return boardDao.updateBoard3(sqlSession, b);
				}
				return update2;
				
			} else {
				return update1;
			}
			
		}
		
		return update1;
	}

	@Override
	public int insertReply(Reply r) {
		return boardDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReply(int boardNo) {
		return boardDao.selectReply(sqlSession, boardNo);
	}


}
