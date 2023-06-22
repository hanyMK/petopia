package com.kh.petopia.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class AjaxReservationController {
	
	@ResponseBody
	@PostMapping(value="coupon.ps", produces="application/json; charset=UTF-8")
	public String ajaxCouponDiscount(String totalFee, String point, String couponType, String discount) {
		
		System.out.println("총결제금액:" + totalFee);
		System.out.println("적립금:" + point);
		System.out.println("쿠폰 타입:" + couponType);
		System.out.println("할인금액(률):" + discount);
		
		// 사용자가 input값 지우면 point에 ""이 들어있는 경우 int로 바꿀 수 없음
		if(point.equals("")) {
			point = "0";
		}
		
		int point_ = Integer.parseInt(point);
		int totalFee_ = Integer.parseInt(totalFee);
		int discount_ = Integer.parseInt(discount);
		
		
		// 쿠폰, 적립금 모두 사용하지 않은 경우
		// 쿠폰 선택한 경우
		// 적립금 선택한 경우 
		// 
		// 쿠폰을 선택하지 않은 경우 
		// 적립금 + 쿠폰 선택한 경우 
		
		if(couponType == null ) {
			// 쿠폰 선택 안 한 경우
			// 아무것도 안 하면돼 .. 
			
			System.out.println("쿠폰 기본 option 누른거임");
			
		}else{
			// 쿠폰 선택한 경우
			
			if( couponType.equals("1") ) {
				System.out.println("1쿠폰");
				totalFee_ -= discount_ ;
				
			}else if( couponType.equals("2") ) {
				System.out.println("2쿠폰");
				
				// 할인 쿠폰
				discount_ = (int)(totalFee_ * (float)discount_ / 100);	// 20/100 => 0.2
				totalFee_ = totalFee_ - discount_;
			}
			
			if( point_ != 0 ) {
				// 입력한 적립금도 함께 빼줘야함
				totalFee_ -= point_ ;
			}
		}
		
		System.out.println("할인금액" + totalFee_);

		
		String[] result = new String[2];
		
		result[0] = Integer.toString(totalFee_);
		result[1] = Integer.toString(discount_);
		
		return new Gson().toJson(result);
		
	}
	
	@ResponseBody
	@PostMapping(value="point.ps", produces="application/json; charset=UTF-8")
	public String ajaxPointDiscount(String totalFee, String point) {
		
		
		int totalFee_ = Integer.parseInt(totalFee);
		int point_ = Integer.parseInt(point);
		
		System.out.println("적립금입력할때오는 컨트롤러");
		
		
		System.out.println("최종 결제 금액:" + totalFee_);
		System.out.println("포인트:"+ point_);
		
		System.out.println("최종 할인 적용 후 결제할 금액");
		
		totalFee_ -= point_;
		
		return Integer.toString(totalFee_);
		
	}
	
	
	
	
	
	
	

}
