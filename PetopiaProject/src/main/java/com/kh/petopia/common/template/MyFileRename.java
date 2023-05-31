package com.kh.petopia.common.template;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class MyFileRename {
	
	public static String saveFile(HttpSession session, MultipartFile upfile) {
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHss").format(new Date());
		
		int randomNum = (int)Math.random() *90000*10000;
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadfiles/");
		
		String changeName = "petopia_" + currentTime + randomNum + ext;
		
		try {
			upfile.transferTo(new File(savePath, changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	
	

}
