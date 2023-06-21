package com.kh.petopia.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxReservationController {
	
	@ResponseBody
	@RequestMapping(value="/coupon.ps", produces="application/json; charset=UTF-8")
	public String ajaxCouponDiscount(String totalFee, String point, String couponType, String discount) {
		
		System.out.println("총결제금액:" + totalFee);
		System.out.println("적립금:" + point);
		System.out.println("쿠폰 타입:" + couponType);
		System.out.println("할인금액(률):" + discount);
		
		// 쿠폰 선택한 경우
		// 쿠폰을 선택하지 않은 경우 
		// 적립금 + 쿠폰 선택한 경우 

		
		if(couponType == null ) {
			// 쿠폰 선택 안 한 경우
			// 아무것도 안 하면돼 .. 
			
			System.out.println("쿠폰 말고 기본 option 누른거임");
			
		}else{
			// 쿠폰 선택한 경우
			
			if( couponType.equals("1") ) {
				System.out.println("1쿠폰");
				// 금액할인 
				// totalFee -= discount
				
			}else if( couponType.equals("2") ) {
				System.out.println("2쿠폰");
				// % 할인
				// totalFee -= ( totalFee * discount/100 )
				
			}
			
			if(point != null) {
				System.out.println();
				// 적립금을 입력한 상태에서 쿠폰을 선택한 경우 
				// 입력한 적립금도 함께 빼줘야함
				// totalFee -= point
			}
		}

		return null;
	}

}
