package com.kh.petopia.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.reservation.model.vo.Employee;
import com.kh.petopia.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {

	public ArrayList<Employee> selectEmployeeList(SqlSessionTemplate sqlSession, int psno) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectEmployeeList", psno);
	}

	public ArrayList<String> selectEmployeeReservation(SqlSessionTemplate sqlSession, Reservation r) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectEmployeeReservation", r);
	}

	public int selectUsageFee(SqlSessionTemplate sqlSession, int psno) {
		return sqlSession.selectOne("reservationMapper.selectUsageFee",psno);
	}

}
