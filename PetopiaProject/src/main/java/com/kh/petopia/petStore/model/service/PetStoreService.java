package com.kh.petopia.petStore.model.service;

import java.util.ArrayList;

import com.kh.petopia.petStore.model.vo.PetStore;

public interface PetStoreService {
	
	// 호텔, 유치원, 미용, 훈련 각각의 펫 스토어 정보를 SELECT하는 SELECT문 
	PetStore selectPetStore(int psno);
	
	// 호텔, 유치원, 미용, 훈련 각각에 해당하는 리뷰리스트를 가져옴 
	// ArrayList<PetStoreReview> list = new ArrayList();

}
