package com.kh.petopia.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.AllOrders;
import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.member.model.dao.MemberDao;
import com.kh.petopia.member.model.vo.CertVO;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.member.model.vo.Pet;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	@Override
	public int joinMember(Member m) {
		return memberDao.joinMember(sqlSession, m);
	}

	@Override
	public int joinMember(Pet pet) {
		return memberDao.joinMemberPet(sqlSession, pet); 
	}

	@Override
	public int joinMember(Attachment memberAtt) {
		return memberDao.joinMemberAtt(sqlSession, memberAtt);
	}


	@Override
	public int updateMember(Member m, Attachment memberAtt) {
		return 0;
	}



	@Override
	public int changeMemberPwd(Member m) {
		return 0;
	}

	@Override
	public ArrayList<AllOrders> selectOrderList(int memberNo) {
		return null;
	}

	@Override
	public AllOrders selectOrdersDatail(AllOrders ao) {
		return null;
	}

	@Override
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession, checkEmail);
	}

	@Override
	public int nicknameCkeck(String nickname) {
		return memberDao.nicknameCkeck(sqlSession, nickname);
	}

	@Override
	public int getCoupon(Coupon c) {
		return 0;
	}

	@Override
	public String findEmail(String nickname) {
		return memberDao.findEmail(sqlSession, nickname);
	}

	@Override
	public int updatePwd(Member m) {
		return memberDao.updatePwd(sqlSession, m);
	}

	@Override
	public int sendMail(CertVO certVo) {
		return memberDao.sendMail(sqlSession, certVo);
	}

	@Override
	public boolean validata(CertVO certVo) {
		return memberDao.validata(sqlSession, certVo);
	}

}
