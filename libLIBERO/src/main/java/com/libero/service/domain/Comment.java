package com.libero.service.domain;

import java.io.Serializable;
import java.sql.Timestamp;


import lombok.Data;

@Data
public class Comment implements Serializable{
	
	private int commentNo;
	private String commentContent;
	private Timestamp regDate;
	private Integer parentCommentNo;
	
	private User user;
	private int postNo;
	private char postType;
	
	public Comment() {
		
	}
	
	
	
}
