package com.libero.web.user;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.tomcat.util.codec.binary.Base64;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/login/*")
public class SNSloginController {
	
	
	private final static String K_CLIENT_ID = "9e6ffb0c08e7ce0c717450fd5b19eb9f";
    private final static String K_REDIRECT_URI = "http://127.0.0.1:8080/libero/user/json/kakaologin";   //아마존 아이피 바꾸기
    private final static String K_LOGOUT_REDIRECT_URI = "http://127.0.0.1:8080/libero/user/json/kakaoLogout";  //아마존 아이피 바꾸기

    public static String getAuthorizationUrl(HttpSession session) {
    	
    	String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"+"client_id="+K_CLIENT_ID+"&redirect_uri="+K_REDIRECT_URI+"&response_type=code";

    	return kakaoUrl;
    }
    
   public static String getLogoutUrl(HttpSession session) {

    	String kakaoUrl = "https://kauth.kakao.com/oauth/logout?"+"client_id="+K_CLIENT_ID+"&logout_redirect_uri="+K_LOGOUT_REDIRECT_URI;

    	return kakaoUrl;
    }
    
    public static JsonNode getAccessToken(String autorize_code) throws Exception {	  
   	
    	final HttpClient httpClient = HttpClientBuilder.create().build();
    	
    	final String url = "https://kauth.kakao.com/oauth/token";
    	
    	final HttpPost httpPost = new HttpPost(url);
    	
    	final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
    	postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
    	postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID));
    	postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI ));
    	postParams.add(new BasicNameValuePair("code", autorize_code)); 
    	
    	JsonNode returnNode = null;
    	
    	try {
    		httpPost.setEntity(new UrlEncodedFormEntity(postParams)); 																																	    		
    		final HttpResponse httpResponse = httpClient.execute(httpPost);
    		
    		ObjectMapper mapper = new ObjectMapper();											
    		returnNode = mapper.readTree(httpResponse.getEntity().getContent());	
    	}catch(UnsupportedEncodingException e) {
    		e.printStackTrace();
    	} catch (ClientProtocolException e) { 
    		e.printStackTrace(); 
    	} catch (IOException e) {
    		e.printStackTrace(); 
    	}
    	return returnNode;
    }
    
    public static JsonNode getKakaoUserInfo(JsonNode accessToken) {	
    	final HttpClient client = HttpClientBuilder.create().build();
    	final String requestUrl = "https://kapi.kakao.com/v2/user/me";
    	final HttpPost post = new HttpPost(requestUrl);
    	
    	post.addHeader("Authorization", "Bearer "+accessToken);
    	JsonNode returnNode = null;
    	
    	try {
    		final HttpResponse response = client.execute(post);
    		
    		ObjectMapper mapper = new ObjectMapper();
    		returnNode = mapper.readTree(response.getEntity().getContent());
    	
    	}catch(UnsupportedEncodingException e) {
    		e.printStackTrace();
    	} catch (ClientProtocolException e) { 
    		e.printStackTrace(); 
    	} catch (IOException e) {
    		e.printStackTrace(); 
    	}
    	return returnNode;
    }
    	
}
