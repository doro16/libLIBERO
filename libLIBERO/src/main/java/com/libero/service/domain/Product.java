package com.libero.service.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;


@Data
public class Product implements Serializable{
	
	private int prodNo;
	private String prodType;
	private String prodName;
	private String prodDetail;
	private int retailPrice;
	private int printPrice;
	private String blindCode;
	private String prodThumbnail;
	private String coverFile;
	private Date regDate;
	private String discountCode;
	private String creator;
	private int salesCount;
	private int likeCount;
	private String author;
	private String purposeCode;
	private String manuFile;
	private int bookPage;
	private String colorType;
	private String sizeType;
	private String coverType;
	private String innerType;
	private short tempCode;
	private String factoryId;
	private String bookCategory;  //0719 추가
	private int reportCount;	 //0805 추가
	
	private int wishNo;
	private int cartNo;
	private int buyAmount;
	
	private int buyNo;
	
	public Product() {
		
	}
	
}
