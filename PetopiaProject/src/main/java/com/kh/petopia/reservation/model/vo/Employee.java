package com.kh.petopia.reservation.model.vo;

import lombok.Data;

@Data
public class Employee {
	
	int employeeNo;			// EMPLOYEE_NO	NUMBER
	int petStore;			// PET_STORE	NUMBER
	String employeeName;	// EMPLOYEE_NAME	VARCHAR2(30 BYTE)
	String employeeInfo;	// EMPLOYEE_INFO	VARCHAR2(1000 BYTE)

}
