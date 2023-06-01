package com.kh.petopia.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	public int MemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.memberListCount");
	}

}
