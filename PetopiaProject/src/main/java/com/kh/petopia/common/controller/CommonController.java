package com.kh.petopia.common.controller;

import java.nio.charset.Charset;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@RestController
public class CommonController {
	
	private static final String URI = "https://dapi.kakao.com/v2/search/web";
	private static final String API_KEY = "1ed88bda51d1f5cb549a7d3dbf650f5a";	
	

	private RestTemplate restTemplate = new RestTemplate();
	
	//private SearchResult searchResult = new  SearchResult();
	
	

//	private String searchResult(String searchKeyWord) {
//		String response = searchDaum(searchKeyWord);
//		return new Gson().toJson(response);
//	}
//	
	@RequestMapping(value="search.daum")
	private String searchDaum(String searchKeyWord) {
	
		
		System.out.println("오시나요" +searchKeyWord);
		
		//1.헤더 객체 생성한 후 json데이터 형식 지정, 토큰 번호 입력
		/*
		 * HttpHeaders란?
		 * 
		 * 왜사용했냐?
		 * 
		 */
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);//서버에서 클라이언트로 보내는 미디어 타입을 지정합니다
		headers.set("Authorization", "KakaoAK " + API_KEY);
		System.out.println("hearder  "+ headers.getOrigin());
		
		//2. POST 요청에 Header값과 쿼리스트링이 있음. 요청 uri를 정의 함
		/*
		 * 주소는 유지 보수하기 까다롭기 때문에 사용한다.
		 * 
		 * UriComponentsBuilder란?
		 * UriComponents 를 Build할 수 있도록 도와주는 클래스
		 * 
		 * UriComponents란?
		 * URI에 대한 정보를 각 구성요소별로 분리하여 변수에 저장하여 가지고 있는 URI 구성요소의 집합
		 * 
		 * 
			① UriComponentsBuilder 클래스의 encode()
			- URI 템플릿을 먼저 인코딩한 후, URI 템플릿 변수 위치에 URI 변수 값을 삽입할 때 그 값을 인코딩한다.(%3B", "%2B)
			
			② UriComponents 클래스의 encode()
			- URI에 포함된 템플릿 변수 위치에 URI 변수 값을 삽입한 후에 URI 컴포넌트를 인코딩한다.(le;?q=123+45)
					 *  
		 */
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(URI)
		.queryParam("sort", "recency")
		.queryParam("page", "1")
		.queryParam("size", "3")
		.queryParam("query",searchKeyWord )
		//.encode();
		;
		
		System.out.println("uriBuilder  "+uriBuilder.toUriString());
		
		//3. restTemplate 이용하기 해더와 바디를 하나의 오브젝트로 만들기
		/*
		 * - HTTP 프로토콜을 사용하여 RESTful API에 액세스 하고 쉽게 사용하여 ‘외부 도메인’에서 데이터를 
		 * 가져오거나 전송할 때 사용되는 스프링 프레임워크의 클래스를 의미합니다.
		 *  동기식 요청(Synchronous request) & 블로킹 요청(Blocking Request):클라이언트에서 요청을 보내면 결과가 반환될 때까지 대기
		 *  HTTP 요청 및 응답을 ‘자동’으로 변환하고 역직렬화하는 기능을 제공합니다. 이를 위해 RestTemplate은 기본적으로 MessageConverter를 사용합니다.
		 *  직렬화(Serialization)
		 *   - 자바 객체를 외부 저장소에 저장하거나 네트워크를 통해 전송하기 위해 객체를 데이터 스트림으로 변환
			역직렬화(Deserialization)
			-  데이터 스트림으로부터 객체를 재구성 , 데이터 스트림이 어떤 객체인지 알아야 하므로 객체의 클래스 정보가 함께 전달
			 
		 */

		HttpEntity<String> entity = new HttpEntity<>(headers);
		System.out.println("entity_body "+entity.getBody());
		
		
		//// 4. HTTP 요청 및 응답 처리 : API호출
		ResponseEntity<String> responseEntity 
		= restTemplate.exchange(uriBuilder.toUriString(), HttpMethod.GET, entity, String.class);
		/*
		 * 	// Http 요청하고 리턴값을 response 변수로 받기
				ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token", // Host
				HttpMethod.POST, // Request Method
				kakaoTokenRequest,	// RequestBody
				String.class);	// return Object
		 */
		
	;
		System.out.println("responseEntity  : " +responseEntity);
		/*
		 * RestTemplate은 요청 url로 String 또는 URI 형태를 받는다.
			JSON 데이터 요청을 처리하기 위해 LinkedMultiValueMap 사용도 가능하다.
			RestTemplate은 HttpClient를 추상화하고 있으며, Connection Pooling을 지원하지 않는다. 따라서 사용한 소켓은 TIME_WAIT 상태가 되며, 재사용하지 못하게 된다. apache에서 제공하는 HttpClient를 구현하여 커넥션 풀 설정을 하자.
		 * 
		 */
		
		//Response Body출력
		String response = responseEntity.getBody();
		
		JsonObject jsonObject = new JsonParser().parse(response).getAsJsonObject();
		System.out.println("response  "+response);

		JsonArray answer =  jsonObject.get("documents").getAsJsonArray();

		//System.out.println("answer  :  "+answer.get(0).getAsJsonObject().get("title"));
		System.out.println(answer);
	
		//toString()과 getAsString()차이
		/*
		 * toString()은 객체가 가지고 있는 정보나 값들을 문자열로 만들어 리턴을 다시 한 번 받기때문에 " " 가 2개 생기는 것 입니다.
		8 그래서 객체들에 들어가 있는 값들을 다른 곳에 호출해서 setText로 담아서 보여주거나 하면
		 */
		return new Gson().toJson(jsonObject.getAsString());
		//인코딩이 깨지는 이유
		/*
		 * 원인은 RestTemplate에서 내부적으로 StirngHttpMessageConverter를 사용해서 데이터를 변환하는데
			이때 사용하는 인코딩이 'ISO-8859-1'이기 때문이다. (무조건)
			그래서 Client코드에서 아래와 같이 'UTF-8'으로 지정해주면 간단하게 해결된다.
		 */
	}
	

}
