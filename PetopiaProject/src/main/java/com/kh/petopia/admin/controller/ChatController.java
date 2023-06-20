package com.kh.petopia.admin.controller;

import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ChatController {

    private static final String API_ENDPOINT = "https://api.openai.com/v1/chat/completions";
    private static final String API_KEY = "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";

    @RequestMapping(value = "sendMessage.ad",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String sendMessage(@RequestBody String message) {
    	System.out.println("123123");
        String response = getChatGptResponse(message);
        return "{\"response\": \"" + response + "\"}";
    }

    private String getChatGptResponse(String message) {
        MultiValueMap<String, String> requestBody = new LinkedMultiValueMap<>();
        requestBody.add("role", "system");
        requestBody.add("role", "user");
        requestBody.add("content", message);
        requestBody.add("model", "gpt-3.5-turbo");
   
        JSONObject jsonRequest = new JSONObject(requestBody.toSingleValueMap());
        String jsonBody = jsonRequest.toString();

        System.out.println(jsonBody); 
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + API_KEY);
        
        
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> entity = new HttpEntity<>(jsonBody, headers);
        ResponseEntity<String> responseEntity = restTemplate.exchange(API_ENDPOINT, HttpMethod.POST, entity, String.class);
        String response = responseEntity.getBody();
        return response;
    }
}