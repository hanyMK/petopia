package com.kh.petopia.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	public int countBoard(SqlSessionTemplate sqlSession, String category) {
		int num = sqlSession.selectOne("boardMapper.countBoard", category);
		return num;
	}
	
	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, 
										PageInfo pi, 
										String category){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoard", category, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}
	
	public Board selectDetailBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectDetailBoard", boardNo);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		int insert1 = 0;
		int insert2 = 0;
		
		if((insert1 = sqlSession.insert("boardMapper.insertBoard1", b)) > 0) {
			if(b.getOriginName() != null) {
				insert2 = sqlSession.insert("boardMapper.insertBoard2", b);
				return insert2;
			} else {
				return insert1;
			}
			
		} else {
			return insert1;
		}
		
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		int update1 = 0;
		int update2 = 0;
		
		if((update1 = sqlSession.update("boardMapper.updateBoard1", b)) > 0) {
			if(b.getOriginName() != null) {
				update2 = sqlSession.update("boardMapper.updateBoard2", b);
				return update2;
			} else {
				return update1;
			}
		} else {
			return update1;
		}
	}
	
	
	
	
}
