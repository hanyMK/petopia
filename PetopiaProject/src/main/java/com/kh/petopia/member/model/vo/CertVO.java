package com.kh.petopia.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data @AllArgsConstructor @NoArgsConstructor
public class CertVO {
	
	private String who, when, secret;
	
	public void bye() {
		System.out.println("바이바이");
	}

}
