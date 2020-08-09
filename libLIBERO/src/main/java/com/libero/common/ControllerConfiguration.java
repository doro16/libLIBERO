package com.libero.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
@EnableWebMvc
public class ControllerConfiguration extends WebMvcConfigurerAdapter implements  WebSocketConfigurer {

	
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    	System.out.println("dddddddddddddddddddddddddddddddddddh");
    	registry.addHandler(new EchoHandler(), "/echo").addInterceptors(new HttpSessionHandshakeInterceptor()) .withSockJS();
    }
    
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

}
