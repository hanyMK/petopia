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
		System.out.println(num);
		return num;
	}
	
	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, 
										PageInfo pi, 
										String category){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoard", category, rowBounds);
	}
	
	
}
