package com.kh.petopia.petStore.model.vo;

import lombok.Data;

@Data
public class PetStore {
	
	int petStoreNo;				// PET_STORE_NO	NUMBER
	String petStoreName;		// PET_STORE_NAME	VARCHAR2(50 BYTE)
	String petStoreAddress;		// PET_STORE_ADDRESS	VARCHAR2(100 BYTE)
	String openTime;			// OPEN_TIME	VARCHAR2(20 BYTE)
	String closeTime;			// CLOSE_TIME	VARCHAR2(20 BYTE)
	String offDay;				// OFF_DAY	VARCHAR2(20 BYTE)
	String petStoreCall;		// PET_STORE_CALL	VARCHAR2(13 BYTE)
	String petStoreInfo;		// PET_STORE_INFO	VARCHAR2(1000 BYTE)
	int usageFee;				// USAGE_FEE	NUMBER

}
