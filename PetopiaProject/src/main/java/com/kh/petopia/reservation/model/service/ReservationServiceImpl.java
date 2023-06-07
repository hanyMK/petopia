package com.kh.petopia.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petopia.reservation.model.dao.ReservationDao;
import com.kh.petopia.reservation.model.vo.Employee;

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
}
