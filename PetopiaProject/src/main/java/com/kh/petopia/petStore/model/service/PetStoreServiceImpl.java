package com.kh.petopia.petStore.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.petStore.model.dao.PetStoreDao;
import com.kh.petopia.petStore.model.vo.PetStore;

@Service
public class PetStoreServiceImpl implements PetStoreService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PetStoreDao petStoreDao;
	
	@Override
	public PetStore selectPetStore(int psno) {
		// 호텔, 유치원, 미용, 훈련 각각의 펫 스토어 정보를 SELECT하는 SELECT문 
		
		return petStoreDao.selectPetStore(sqlSession,psno);
		
	}

}
