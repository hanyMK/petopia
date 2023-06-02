package com.kh.petopia.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.member.model.vo.Member;

@Repository
public class AdminDao {
	
	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.memberListCount");
	}
	
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		return (ArrayList)sqlSession.selectList("adminMapper.memberList");
	}
}
