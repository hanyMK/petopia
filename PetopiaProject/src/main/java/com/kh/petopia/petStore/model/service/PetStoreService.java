package com.kh.petopia.petStore.model.service;

import java.util.ArrayList;

import com.kh.petopia.petStore.model.vo.PetStore;
import com.kh.petopia.petStore.model.vo.PetStoreReview;

public interface PetStoreService {
	
	// 호텔, 유치원, 미용, 훈련 각각의 펫 스토어 정보를 SELECT하는 SELECT문 
	PetStore selectPetStore(int psno);

	ArrayList<PetStoreReview> selectReviewList(int psno);
	
	
}
