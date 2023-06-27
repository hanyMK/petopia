package com.kh.petopia.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.petopia.myPage.model.service.MyPageService;
import com.kh.petopia.myPage.model.vo.Petpay;

@Controller
public class AjaxReservationController {
	
	@Autowired
	private MyPageService myPageService;
   
   @ResponseBody
   @PostMapping(value="calculate.ps", produces="application/json; charset=UTF-8")
   public String[] ajaxCouponDiscount(int totalFee, int couponType, int discount, int inputPoint) {
      
      System.out.println("-------------------");
      System.out.println("총결제금액:" + totalFee);
      System.out.println("쿠폰 타입:" + couponType);
      System.out.println("할인금액(률):" + discount);
      System.out.println("입력적립금" + inputPoint);
      
      // 쿠폰
      // 적립금
      // 쿠폰, 적립금 둘 다 
      
      if( couponType == 1 ) {
         System.out.println("1쿠폰");
         totalFee -= discount ;
         
      }else if( couponType == 2 ) {
         System.out.println("2쿠폰");
         // discount = 20 
         
         discount = (int)(totalFee * (double)discount / 100);   // 20/100 => 0.2
         totalFee -= discount;
      }
      
      if(inputPoint != 0 ) {
         totalFee -= inputPoint;
      }
      
      System.out.println(totalFee);
      
      String[] result = new String[3];
      result[0] = Integer.toString(discount);
      result[1] = Integer.toString(inputPoint);
      result[2] = Integer.toString(totalFee);
      
      return result;
   }
   
   @ResponseBody
   @RequestMapping(value="reservationPetPay.ps")
   public String ajaxReservationPetPay(Petpay p, HttpSession session,ModelAndView mv) {
	   
	   System.out.println(p);
	   
	   myPageService.insertChargePetpay(p);
	   
	   return new Gson().toJson("안녕");
	   
   }
      
   
   

}