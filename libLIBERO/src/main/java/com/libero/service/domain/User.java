package com.libero.service.domain;



import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class User  implements Serializable{

	private String userId;
	private String password;
	private String nickname;
	private String profile;
	private String genderCode;
	private String name;
	private String address;
	private String phone;
	private Date birthDate;
	private short phoneCode;
	private short userCode;
	private String role;
	private Date regDate;
	private String factoryNo;
	private String cashCode;
	private int a5Price;
	private int b5Price;
	private int a4Price;
	private int colorPrice;
	private int blackPrice;
	private int snowPrice;
	private int montPrice;
	private int artePrice;
	private int whitePrice;
	private int ivoryPrice;
	private int roughPrice;
	private String kakaoId;

	/*
	 * public User getUser(){ return new User(); }
	 */
}


