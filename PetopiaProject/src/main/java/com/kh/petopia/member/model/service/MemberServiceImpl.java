package com.kh.petopia.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petopia.admin.model.vo.Coupon;
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

	@Transactional
	@Override
	public int updateMember(Member m, Attachment memberAtt) {
		int att = memberAtt != null?memberDao.updateMember(sqlSession, memberAtt):0;
		return memberDao.updateMember(sqlSession, m)*att;
		
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
