package com.kh.petopia.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.member.model.vo.CertVO;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.member.model.vo.Pet;

@Repository
public class MemberDao {

	
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m );
		
	}
	
	
	public int joinMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.joinMember", m);
		
	}

	public int joinMemberPet(SqlSessionTemplate sqlSession, Pet pet) {
		return sqlSession.insert("memberMapper.joinMemberPet", pet);
		
	}

	public int joinMemberAtt(SqlSessionTemplate sqlSession, Attachment memberAtt) {
		return sqlSession.insert("memberMapper.joinMemberAtt", memberAtt);
		
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
		
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Attachment memberAtt) {
		
		return sqlSession.update("memberMapper.updateMemberAtt", memberAtt);
		
	}
	
	
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.delete("memberMapper.deleteMember", userId);
	}
	
	public int emailCheck(SqlSessionTemplate sqlSession, String emailCheck) {
		return sqlSession.selectOne("memberMapper.emailCheck", emailCheck);
	}
	
	public int nicknameCkeck(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.nicknameCkeck", nickname);
	}
	
	public String findEmail(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.findEmail", nickname);
		
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	
	public int sendMail(SqlSessionTemplate sqlSession, CertVO certVo) {
		return sqlSession.insert("memberMapper.sendMail", certVo);
	}
	
	
	public boolean validata(SqlSessionTemplate sqlSession, CertVO certVo ) {
		CertVO result = sqlSession.selectOne("memberMapper.validata", certVo);
		System.out.println("dao결과" + result);
		
		if(result == null) {
			sqlSession.delete("memberMapper.remove", certVo);
		}
		
		return result != null;
	
	}
	
	
}
