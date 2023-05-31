package com.kh.petopia.common.model.vo;

import lombok.Data;

@Data
public class Attachment {
	private int fileNo;//FILE_NO	NUMBER
	private int fileCategory;//FILE_CATEGORY	NUMBER
	private int refNo;//REF_NO	NUMBER
	private int fileLevel;//FILE_LEVEL	NUMBER
	private String originName;//ORIGIN_NAME	VARCHAR2(225 BYTE)
	private String changeName;//CHANGE_NAME	VARCHAR2(255 BYTE)
	private String filePath;//FILE_PATH	VARCHAR2(1000 BYTE)
	private String fileStatus;//FILE_STATUS	CHAR(3 BYTE)
	

}
