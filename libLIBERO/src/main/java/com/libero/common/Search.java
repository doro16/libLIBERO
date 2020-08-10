package com.libero.common;

import java.io.Serializable;

import lombok.Data;

@Data
public class Search implements Serializable {

	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	
	private int endRowNum;
	private int startRowNum;
	

}
