package com.libero.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.libero.service.domain.User;


@ServerEndpoint(value = "/echo")
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	
	//webSocketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 연결 
	//해당 객체를 통해 메세지를 주고 받음
	private Map<String, WebSocketSession> userMap;

	public EchoHandler() {
		  userMap = new HashMap<String, WebSocketSession>();		 
	}
	
	// 클라이언트가 서버로 연결된 이후 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("----------------------------------------------------------------------- ");
		System.out.println("WEBSOCKET afterConnectionEstablished : 연결 생성");
		System.out.println("----------------------------------------------------------------------- ");

		System.out.println(">>>1 "+session);
		System.out.println(">>>2 "+session.getId());
		System.out.println(">>>3 "+session.getAttributes());
		
		Map<String, Object> httpSession = session.getAttributes();
		User user = (User) httpSession.get("user");
		
		if(user != null) {
		System.out.println(">>>>>>>>>>>>>>>>>>>2"+user.getUserId());
		String senderNickname = user.getNickname();
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+senderNickname);
		userMap.put(senderNickname, session);
		}
	}
	
	// 클라이언트가 서버로 메세지 전송했을 때 실행
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("----------------------------------------------------------------------- ");
		System.out.println("handleTextMessage : 메세지 수신");
		System.out.println("메세지 : "+message.getPayload());
		System.out.println("----------------------------------------------------------------------- ");
		
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		
		if( type != null && type.equals("message")) {
			String sendNickname = object.getString("sendNickname");
			String recvNickname = object.getString("recvNickname");
			userMap.put(sendNickname, session);
					
			WebSocketSession ws = (WebSocketSession)userMap.get(recvNickname);
			
			if(ws != null) {
				ws.sendMessage(new TextMessage(sendNickname+"님이"+recvNickname+"에 책 만들기를 의뢰하였습니다."));
			}
	}
}
	
	// 클라이언트가 연결 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("----------------------------------------------------------------------- ");
		System.out.println("afterConnectionClosed : 연결 종료");
		System.out.println("----------------------------------------------------------------------- ");
		userMap.clear();
	}
	
	 // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        System.out.println("----------------------------------------------------------------------- ");
        System.out.println("전송오류 발생");
        System.out.println("----------------------------------------------------------------------- ");
    }

}
