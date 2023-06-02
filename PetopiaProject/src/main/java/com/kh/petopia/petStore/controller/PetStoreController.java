package com.kh.petopia.petStore.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petopia.petStore.model.service.PetStoreService;
import com.kh.petopia.petStore.model.vo.PetStore;
import com.kh.petopia.petStore.model.vo.PetStoreReview;

@Controller
public class PetStoreController {
	
	@Autowired
	private PetStoreService petStoreService;
	
	// 호텔
	@RequestMapping("petHotel.pe")
	public ModelAndView petHotel(ModelAndView mv) {
		
		int psno = 1;	// 스토어번호 1번은 호텔
		
		// 애견 호텔 데이터 조회
		PetStore petHotel = petStoreService.selectPetStore(psno);
		
		// 애견 호텔 관련 리뷰 리스트 조회
		
		if( petHotel  != null ) {
			
			System.out.println(petHotel);
			mv.addObject("petHotel",petHotel);
			mv.setViewName("petStore/petHotel");
			
		}else {
			mv.addObject("errorMsg","애견호텔 페이지 이동 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	// 유치원
	@RequestMapping("petSchool.pe")
	public ModelAndView petSchool(ModelAndView mv) {
		
		int psno = 2;	// 스토어번호 2번은 유치원
		
		// 애견 유치원 데이터 조회
		PetStore petSchool = petStoreService.selectPetStore(psno);
		
		// 애견 유치원 관련 리뷰 리스트 조회
		
		if( petSchool  != null ) {
			
			System.out.println(petSchool);
			mv.addObject("petSchool",petSchool);
			mv.setViewName("petStore/petSchool");
			
		}else {
			mv.addObject("errorMsg","애견호텔 페이지 이동 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 미용
	@RequestMapping("petSalon.pe")
	public ModelAndView petSalon(ModelAndView mv) {
		
		
		int psno = 3;	// 스토어번호 3번은 미용
		
		// 애견 미용 데이터 조회
		PetStore petSalon = petStoreService.selectPetStore(psno);
		
		// 애견 미용 관련 리뷰 리스트 조회
		ArrayList<PetStoreReview> pList = petStoreService.selectReviewList(psno);
		
		System.out.println(pList);
		
		
		if( petSalon  != null && pList != null) {
			
			System.out.println(petSalon);
			mv.addObject("petSalon",petSalon);
			mv.addObject("pList",pList);
			mv.setViewName("petStore/petSalon");
			
		}else {
			mv.addObject("errorMsg","애견미용 페이지 이동 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
		
	}
	
	
	// 훈련
	@RequestMapping("petTraining.pe")
	public ModelAndView petTraining(ModelAndView mv) {
		
		int psno = 4;	// 스토어번호 4번은 훈련
		
		// 애견 훈련 데이터 조회
		PetStore petTraining = petStoreService.selectPetStore(psno);
		
		// 애견 훈련 관련 리뷰 리스트 조회
		
		if( petTraining  != null ) {
			
			System.out.println(petTraining);
			mv.addObject("petTraining",petTraining);
			mv.setViewName("petStore/petTraining");
			
		}else {
			mv.addObject("errorMsg","애견미용 페이지 이동 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
		// 2. 애견미용에 대한 리뷰 데이터 조회
	}
	

	
	
	

	

}
