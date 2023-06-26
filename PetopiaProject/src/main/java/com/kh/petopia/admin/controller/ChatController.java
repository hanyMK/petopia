package com.kh.petopia.admin.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.petopia.admin.model.service.AdminService;


@RestController
public class ChatController {
	
	@Autowired
	private AdminService adminService;
	
    private static final String API_ENDPOINT = "https://api.openai.com/v1/chat/completions";
    private static final String MODEL = "gpt-3.5-turbo";
    
    StringBuilder chatHistory = new StringBuilder();
    
    @RequestMapping(value = "sendMessage.ct",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String sendMessage(@RequestBody String message) {
    	String response = getChatGptResponse(message);

    	return new Gson().toJson(response);
    }

    private String getChatGptResponse(String message) {
    	  
    	 String body = "{\"model\": \"" + MODEL + "\", \"messages\": ["
    			 	 + "{\"role\": \"assistant\", \"content\": \"펫토피아라는 웹사이트 고객센터의 건방진 강아지 직원. 반려견 관련 질문만 받음. 두 문장내로 대답\"}"
    			 	 + chatHistory.toString() // 이전 대화 내용 추가
    				 + ",{\"role\": \"user\", \"content\": \"" + message + "\"}], \"max_tokens\": 1000}"; 
		 
    	 String apiKey = adminService.bringKey();
    	 
		  System.out.println("body는 " + body);
		  HttpHeaders headers = new HttpHeaders();
		  headers.setContentType(MediaType.APPLICATION_JSON);
		  headers.set("Authorization", "Bearer " + apiKey);
		 
		  
		  RestTemplate restTemplate = new RestTemplate(); 
		  HttpEntity<String> entity = new HttpEntity<>(body, headers); 
		  ResponseEntity<String> responseEntity = restTemplate.exchange(API_ENDPOINT, HttpMethod.POST, entity, String.class);
		  String response = responseEntity.getBody(); 
		  JsonObject jsonResponse = new JsonParser().parse(response).getAsJsonObject();

		  System.out.println(jsonResponse);

		  String answer = jsonResponse.get("choices").getAsJsonArray().get(0).getAsJsonObject().get("message").getAsJsonObject().get("content").getAsString();
		  
		  //chatHistory += ",{\"role\": \"user\", \"content\": \"" + message + "\"}"; // 이전 사용자 대화 내용 추가
		//  chatHistory += ",{\"role\": \"assistant\", \"content\": \"" + answer + "\"}"; // Assistant의 응답 추가
		  
		  chatHistory.append(",{\"role\": \"user\", \"content\": \"" + message + "\"}")
		  			 .append(",{\"role\": \"assistant\", \"content\": \"" + answer + "\"}");
		  return answer;
		 
    }
    
    
   
}









