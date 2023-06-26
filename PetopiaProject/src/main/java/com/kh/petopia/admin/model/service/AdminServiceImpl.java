package com.kh.petopia.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public ArrayList memberSearch(Map params) {
		return adminDao.memberSearch(sqlSession, params);
	}

	@Override
	public ArrayList<Coupon> cList(PageInfo pi) {
		return null;
	}

	@Override
	public int salesCheck() {
		return adminDao.salesCheck(sqlSession);
	}

	@Override
	public int shippingListCount() {
		return adminDao.shippingListCount(sqlSession);
	}

	@Override
	public ArrayList ShippingList() {
		return adminDao.shippingList(sqlSession);
	}

	@Override
	public int toalPayment() {
		return adminDao.totalPayment(sqlSession);
	}

	@Override
	@Transactional
	public void shippingRelease(int[] receiptNos) {
		for(int i =0; i < receiptNos.length; i++) {
			adminDao.shippingRelease(sqlSession, receiptNos[i]);
		}
	}

	@Override
	public String bringKey() {
		return adminDao.bringKey(sqlSession);
	}



}
