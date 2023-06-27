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

	// --------------------------------------------------------------------
	
	public int insertReservation(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertReservation", r);
	}

	public int insertReservationReceipt(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertReservationReceipt",r);
	}
	
	public int insertMinusPetPay(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertMinusPetPay",r);
	}
	
	public int insertMinusPoint(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertMinusPoint",r);
	}

	public int updateCouponStatus(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.updateCouponStatus",r);
	}

	public int insertPlusPoint(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertPlusPoint",r);
	}
	

	public int selectReservationNo(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("reservationMapper.selectReservationNo");
	}

	public Reservation selectCompleteReservation(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reservationMapper.selectCompleteReservation");
	}

}
