package com.kh.petopia.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.board.model.vo.Reply;
import com.kh.petopia.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	public int countBoard(SqlSessionTemplate sqlSession, HashMap type) {
		int num = sqlSession.selectOne("boardMapper.countBoard", type);
		return num;
	}
	
	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, 
										PageInfo pi, 
										HashMap type){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoard", type, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}
	
	public Board selectDetailBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectDetailBoard", boardNo);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard1", b);
	}
	
	public int insertBoard2(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard2", b);
	}
	
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard1", b);

	}
	
	public int updateBoard2(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard2", b);
	}
	
	public int updateBoard3(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateBoard3", b);
	}
	
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", boardNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r){
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	
}
