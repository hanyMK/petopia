package com.kh.petopia.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.admin.model.dao.AdminDao;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int memberListCount() {
		return adminDao.MemberListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> memberList(PageInfo pi) {
		return null;
	}

}
