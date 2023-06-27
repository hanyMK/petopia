package com.kh.petopia.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petopia.reservation.model.dao.ReservationDao;
import com.kh.petopia.reservation.model.vo.Employee;
import com.kh.petopia.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservationDao reservationDao;

	@Override
	public ArrayList<Employee> selectEmployeeList(int psno) {
		return reservationDao.selectEmployeeList(sqlSession,psno);
	}

	@Override
	public ArrayList<String> selectEmployeeReservation(Reservation r) {
		return reservationDao.selectEmployeeReservation(sqlSession,r);
	}

	@Override
	public int selectUsageFee(int psno) {
		return reservationDao.selectUsageFee(sqlSession,psno);
	}

	@Override
	@Transactional
	public int insertReservation(Reservation r) {
		
		int result = 1 ;
		
		int[] arr = {0, 0, 0, 1, 1,0}; 
		
		// INSERT RESERVATION 
		arr[0] = reservationDao.insertReservation(sqlSession, r);
		System.out.println("왜안와0");
		
		 // INSERT RESERVATION_RECEIPT
		arr[1] = reservationDao.insertReservationReceipt(sqlSession,r);
		System.out.println("왜안와1");
		
		 // 1. 결제시 사용한  펫페이 빼기 
		arr[2] = reservationDao.insertMinusPetPay(sqlSession,r);
		System.out.println("왜안와2");
		
		 // 결제시 사용한 펫페이구하려면 
		 // r.reservationFee - point - coupon
		 // couponNo으로 할인금액 계산해서 가져온 후 빼야함 
		 
		// 2. 적립금 사용한 경우  INSERT - POINT
		 if(r.getPoint() != 0) {
			 arr[3] = reservationDao.insertMinusPoint(sqlSession,r);
			 System.out.println("왜안와3");
		 }else {
			 System.out.println("왜안와3");
		 }
		 
		 // 3. 쿠폰을 사용한 경우  UPDATE COUPON_STATUS
	    if( r.getCouponNo() != 0) {
	    	arr[4] = reservationDao.updateCouponStatus(sqlSession,r);	   
	    	System.out.println("왜안와4");
	    }else {
	    	System.out.println("왜안와4");
	    }
	    
	    // 결제가 완료되면 결제금액의 5%적립해줌! 
	    arr[5] = reservationDao.insertPlusPoint(sqlSession,r);
	    System.out.println("왜안와5");
	    
	    for(int i=0; i<arr.length; i++) {
	    	result *= arr[i];
	    }
	    
		return result;
		 
	}

	@Override
	public int selectReservationNo() {
		return reservationDao.selectReservationNo(sqlSession);
	}
	




	
}
