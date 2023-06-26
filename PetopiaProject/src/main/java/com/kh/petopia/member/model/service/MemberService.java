package com.kh.petopia.member.model.service;

import java.io.IOException;
import java.util.ArrayList;

import com.kh.petopia.admin.model.vo.Coupon;

import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.member.model.vo.CertVO;
import com.kh.petopia.member.model.vo.Member;
import com.kh.petopia.member.model.vo.Pet;

public interface MemberService {
	
	//로그인 서비스(SELECT)
		Member loginMember(String email);
		
		//회원가입 서비스(INSERT)
		int joinMember(Member m );
		int joinMember(Pet pet );
		int joinMember(Attachment memberAtt );
		

		//SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = '시퀀스명(대문자)'-이거안돼;
		/*
		 * 펫 테이블과 보드넘버 테이블 삽입 시 currval대신 마지막 시퀀스 번호 조회해서 등록
		 * INSERT INTO TP_TABLE(
			    SEQ, 
			    CODE, 
			    NAME
			    )
			VALUES(
			    (SELECT NVL(MAX(MEMBER_NO), 0) FROM MEMBER),
			    'A01',
			    'TEST'
	    )
	 
		 */
		
		//회원정보 수정(UPDATE)
		int updateMember(Member m);
		int updateMember(Attachment memberAtt);
		

		//비밀번호 재설정(INSERT/이메일, 새로운 비밀번호)
		//이메일 인증을 동반
		//1. 이메일이 존재하는지 확인(SELECT COUNT(*) FROM MEMBER WHERE EMAIL = ? /이메일 중복체크 SELECT문 활용)
		//2. 메일로 비밀 번호 변경 가능한 링크 전송
		//3. 링크를 통해 비밀번호 변겅(링크에 회원 이메일 정보가 담겨있어야함 또는 회원이 입력한 이메일을 변수에 담아서 기록해야함)
		//4. 이메일과 새로운 비밀 번호를 UPDATE
		
//		int deleteMember(String email);
		
		//주문 배송 리스트 조회(SELECT/멤버 넘버)
		//날짜 순 내림차순(DESC)??
		
		//------AJax--------------------------

		//이메일 중복 체크(SELECT)
		int emailCheck(String checkEmail);
		//닉네임 중복체크(SELECT)
		int nicknameCkeck(String nickname);
		//이메일 찾기(select)
		String findEmail(String nickname);
		
		//비밀번호 재설정(update)
		//
		//2. 받은이메일로 비밀번호 재설정 링크 전송
		//3. 링크를 전달할때 무작위값을 보내서 확인>??
		//4. 비밀번호 변경(update)
		int updatePwd(Member m); 
		
		//인증키 저장
		int sendMail(CertVO certVo);
		
		//인증키 확인 및 
		boolean validata(CertVO certVo);
		
		
		

}
