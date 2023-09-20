package com.kh.petopia.common.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@RestController
public class CommonController {
	
	private static final String URI = "https://dapi.kakao.com/v2/search/web";
	private static final String API_KEY = "1ed88bda51d1f5cb549a7d3dbf650f5a";
	
	@RequestMapping(value="search.daum")
	private String searchDaum(String searchKeyWord) {
		System.out.println("오시나요" +searchKeyWord);
//		StringBuilder sb = new StringBuilder();
//		sb.append(URI);
//		sb.append("sort=recency&page=1&size=10&query=" );
//		sb.append(searchKeyWord);
	
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Authorization", "KakaoAK " + API_KEY);
		
		//GET요청에 Header값과 쿼리스트링이 있음
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(URI)
		.queryParam("sort", "recency").queryParam("page", "1").queryParam("size", "3")
		.queryParam("query",searchKeyWord );
		
		
		//restTemplate 이용하기
		RestTemplate resetTemplate = new RestTemplate();
		HttpEntity<String> entity = new HttpEntity<>(headers );
		ResponseEntity<String> responseEntity = resetTemplate.exchange(uriBuilder.toUriString(), HttpMethod.GET, entity, String.class);
		String response = responseEntity.getBody();
		JsonObject jsonObject = new JsonParser().parse(response).getAsJsonObject();
		System.out.println(jsonObject);
		//{"documents":[
		//{"contents":"https://namu.wiki/w/%<b>EC</b>%B5%9C%EA%B0%<b>95%</b><b>EC</b>%<b>95%</b>BC%EA%B5%AC/%<b>EB</b>%B9%84%ED%8C%90%20%<b>EB</b>%B0%8F%20%<b>EB</b>%<b>85%</b>BC%<b>EB</b>%9E%80#s-2.1 최강야구를 무조건 옹호할 생각보단. 2번 항목이 너무 초딩장난수준이라 빡쳐서 올림. 2...","datetime":"2023-09-20T02:00:16.000+09:00","title":"최강야구 나무위기 비판 내용에 반박글 올림.","url":"https://gall.dcinside.com/mgallery/board/view/?id=choigangbaseball&no=128064"}
		//,{"contents":"이건 다이랙트x 오류 설치해야하는것들 싸이트... https://powersu.online/%<b>EC</b>%9C%<b>88%</b><b>EB</b>%8F%84%<b>EC</b>%9A%B0-dx12-is-not-supported-on-your-system-%ED%<b>95%</b>B4%EA%B2%B0%<b>EB</b>%B0%A9%<b>EB</b>%B2%<b>95</b>/ 윈도우 DX12 is not...","datetime":"2023-09-20T01:21:18.000+09:00","title":"다이랙트 오류 이거 다해봣는데 안됨(해결법아시는분?)","url":"https://gall.dcinside.com/mgallery/board/view/?id=first_descendant&no=7536"},
		//{"contents":"0299_00005 지니아트 화홍 평붓 948 낱자루 (1호~8호) 구성붓 %<b>EC</b>%A7%80%<b>EB</b>%8B%<b>88%</b><b>EC</b>%<b>95%</b>84%ED%8A%B8%20%ED%99%94%ED%99%8D%20%ED%8F%89%<b>EB</b>%B6%93%20948%20%<b>EB</b>%82%B1%<b>EC</b>%9E%90%<b>EB</b>%A3%A8%20%281%ED%98%B8~8%ED%98...","datetime":"2023-09-19T21:03:21.000+09:00","title":"화홍 평붓 948 낱자루 (1호~8호) 구성붓","url":"https://www.jiniart.net/FrontStore/m/goods/mGoodsView.phtml?iGoodsId=0299_00005"}]
		//,"meta":{"is_end":false,"pageable_count":592,"total_count":102689}}
		JsonObject answer = (JsonObject) jsonObject.get("documents").getAsJsonArray().get(0).getAsJsonArray().get("title");
		System.out.println(answer.toString());
		return "no";
	}
	

}
