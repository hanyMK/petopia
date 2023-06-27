package com.kh.petopia.petStore.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.petStore.model.dao.PetStoreDao;
import com.kh.petopia.petStore.model.vo.PetStore;
import com.kh.petopia.petStore.model.vo.PetStoreReview;

@Service
public class PetStoreServiceImpl implements PetStoreService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PetStoreDao petStoreDao;
	
	@Override
	public PetStore selectPetStore(int psno) {
		// 호텔, 유치원, 미용, 훈련 각각의 펫 스토어 정보 SELECT
		return petStoreDao.selectPetStore(sqlSession,psno);
	}
	
	@Override
	public ArrayList<PetStoreReview> selectReviewList(int psno) {
		// 호텔, 유치원, 미용, 훈련 각각의 리뷰 리스트를 SELECT
		return petStoreDao.selectReviewList(sqlSession,psno);
	}
	


}
