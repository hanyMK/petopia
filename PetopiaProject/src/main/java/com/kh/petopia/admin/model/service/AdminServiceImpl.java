package com.kh.petopia.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.admin.model.dao.AdminDao;
import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.member.model.dao.MemberDao;
import com.kh.petopia.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int memberListCount() {
		return adminDao.memberListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> memberList(PageInfo pi) {
		return adminDao.memberList(sqlSession, pi);
	}

	@Override
	public int insertCoupon(Coupon c) {
		return adminDao.insertCoupon(sqlSession , c);
	}

	@Override
	public int adminCouponListCount() {
		return adminDao.adminCouponListCount(sqlSession);
	}
	@Override
	public ArrayList<Coupon> adminCouponList(PageInfo pi) {
		return adminDao.adminCouponList(sqlSession, pi);
	}

	@Override
	public int memberSearchCount(Map params) {
		return adminDao.memberSearchCount(sqlSession, params);
	}
	
	@Override
	public ArrayList memberSearch(Map params,PageInfo pi) {
		return adminDao.memberSearch(sqlSession, params, pi);
	}

	@Override
	public ArrayList<Coupon> cList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}



}
