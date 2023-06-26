package com.kh.petopia.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class KakaoService {
	
//	@Autowired
//	private MemberService memberService;
//
//	
	public String getToken(String code) throws IOException, ParseException{
		String kakaoUri = "https://kauth.kakao.com/oauth/token";
		URL url = new URL(kakaoUri);
		
		HttpsURLConnection urlConnection = (HttpsURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));;
		
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=1ed88bda51d1f5cb549a7d3dbf650f5a");
		sb.append("&redirect_uri=http://localhost:8282/petopia/kakaoMemberEnroll.member");
		sb.append("&code="+code);
		
		bw.write(sb.toString());
		bw.flush();
		
		//System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = "";
		String responseData = "";
		
		while((line = br.readLine()) != null) {
			responseData +=line;
		}
		//System.out.println(responseData);
		//엑세스 토큰 필요
		
		JSONParser parser  = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String acccessToken = element.get("access_token").toString();
		//System.out.println(acccessToken);
		
		bw.close();
		br.close();
		
		return acccessToken;
		
	}

	public String getUserInfo(String accessToken) {
		String kakaourl = "https://kapi.kakao.com/v2/user/me";
		String email ="";
		try {
			URL url = new URL(kakaourl);
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();		
			
			urlConnection.setRequestMethod("GET");
			urlConnection.setRequestProperty("Authorization", "Bearer " +accessToken );
			
			System.out.println(urlConnection.getResponseCode());
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			String responseData = "";
			
			while((line = br.readLine()) != null) {
				responseData +=line;
			}
			///System.out.println("responseData  " +responseData);
			
			JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
			JSONObject kakaoAccountObj = (JSONObject)responseObj.get("kakao_account");
			//JSONObject profileObj = (JSONObject)responseObj.get("properties");
			
			//System.out.println(kakaoAccountObj);
			//System.out.println(profileObj);
		
		//	String profileImg = profileObj.get("profile_image").toString();
			email = kakaoAccountObj.get("email").toString();
			System.out.println( "/"+  email);
			
			
			br.close();
			
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return email;
	}
	
	
	
}
