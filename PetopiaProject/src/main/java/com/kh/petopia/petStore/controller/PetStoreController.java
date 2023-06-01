package com.kh.petopia.petStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petopia.petStore.model.service.PetStoreService;
import com.kh.petopia.petStore.model.vo.PetStore;

@Controller
public class PetStoreController {
	
	@Autowired
	private PetStoreService petStoreService;
	
	@RequestMapping("petSalon.pe")
	public ModelAndView petSalon(int psno,
						   ModelAndView mv) {
		
		// 애견 미용은 고정적으로 번호가 3번
		// 메인에서 미용을 클릭했을 때 3번을 넘겨주거나 
		// 아니면그냥여기서 상수값 3을 사용해도 되니까 안 넘겨도될 듯! 혹시 모르니까 그냥 넘겨주는 걸로 일단 쓰기
		
		// ----------------------------------------------------------------
		
		// 애견미용에 접속했을 때 필요한 데이터
		
		// 1. 애견미용 데이터 

		// 1-1. 애견미용객체
		PetStore petSalon = petStoreService.selectPetStore(psno);
		
		if( petSalon  != null ) {
			
			mv.addObject("petSalon",petSalon);
			mv.setViewName("petStore/petSalon");
			
		}else {
			mv.addObject("errorMsg","애견미용 페이지 이동 실패");
			mv.setViewName("common/errorPage");
			
		}
		
		return mv;
		
		// 2. 애견미용에 대한 리뷰 데이터 
		
		
		
		
	}

}
