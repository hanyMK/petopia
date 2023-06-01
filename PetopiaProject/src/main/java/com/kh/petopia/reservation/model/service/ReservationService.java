package com.kh.petopia.reservation.model.service;

import java.util.ArrayList;

import com.kh.petopia.reservation.model.vo.Employee;

public interface ReservationService {
	
	// 미용사 리스트 조회 
	ArrayList<Employee> selectEmployeeList(int psno);

}
