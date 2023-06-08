package com.kh.petopia.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.reservation.model.vo.Employee;

@Repository
public class ReservationDao {

	public ArrayList<Employee> selectEmployeeList(SqlSessionTemplate sqlSession, int psno) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectEmployeeList", psno);
	}

}
