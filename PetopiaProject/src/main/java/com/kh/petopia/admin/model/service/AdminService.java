package com.kh.petopia.admin.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.petopia.common.model.vo.PageInfo;
import com.kh.petopia.member.model.vo.Member;

public interface AdminService {
	
	// 총 맴버 수 조회
	int memberListCount();
	
	// 맴버 목록 조회 + 페이징처리 (SELECT)
	ArrayList<Member> memberList(PageInfo pi);
	
	
	
	
}
