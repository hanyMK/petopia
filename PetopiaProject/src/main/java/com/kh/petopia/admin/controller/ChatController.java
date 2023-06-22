package com.kh.petopia.admin.controller;

import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@RestController
public class ChatController {

    private static final String API_ENDPOINT = "https://api.openai.com/v1/chat/completions";
    private static final String API_KEY = "";
    private static final String MODEL = "gpt-3.5-turbo";
    
    
    
    @RequestMapping(value = "sendMessage.ad",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String sendMessage(@RequestBody String message) {
    	String b = getChatGptResponse(message);
    	return new Gson().toJson(b);
    }

    private String getChatGptResponse(String message) {
    	
		  String body = "{\"model\": \"" + MODEL + "\", \"messages\": [{\"role\": \"assistant\", \"content\": \"펫토피아라는 강아지관련 웹사이트 고객센터 직원이자 반려견 전문가\"},{\"role\": \"user\", \"content\": \"" + message + "\"}]}";
		  System.out.println("body는 " +body);
		  HttpHeaders headers = new HttpHeaders();
		  headers.setContentType(MediaType.APPLICATION_JSON);
		  headers.set("Authorization", "Bearer " + API_KEY);
		 
		  
		  RestTemplate restTemplate = new RestTemplate(); 
		  HttpEntity<String> entity = new HttpEntity<>(body, headers); 
		  ResponseEntity<String> responseEntity = restTemplate.exchange(API_ENDPOINT, HttpMethod.POST, entity, String.class);
		  String response = responseEntity.getBody(); 
		  JsonObject jsonResponse = new JsonParser().parse(response).getAsJsonObject();

		  
		  JSONParser parser = new JSONParser();

		  String a = jsonResponse.get("choices").getAsJsonArray().get(0).getAsJsonObject().get("message").getAsJsonObject().get("content").getAsString();
		  return a;
		 
    }
}