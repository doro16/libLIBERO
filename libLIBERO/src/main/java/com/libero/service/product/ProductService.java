package com.libero.service.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.libero.common.Search;
import com.libero.service.domain.Product;
import com.libero.service.domain.Review;

public interface ProductService {	
	
	//메인을 위한 getBookList
	public Map<String, Object> getBookList() throws Exception;
	//============================서점, 작가서비스
	public List<Product> getBookList(Search search) throws Exception;
	
	public List<Product> getBookListByCategory(String category, Search search) throws Exception;
	
	public List<Product> getBookListBySearch(Search search) throws Exception;

	public Product getProduct(int prodNo) throws Exception;
	
	public List<Product> getProductList(String prodType, Search search) throws Exception;
	
	public List<Product> getProductListBySearch(Search search, String prodType) throws Exception;
	

   //============= 상품갯수 카운팅
	public int getBookTotalCount() throws Exception;
	
	public int getBookTotalCount(String category) throws Exception;

	public int getBookTotalCountBySearch(Search search) throws Exception;
	
	public int getProductTotalCount(String prodType) throws Exception;
	
	public int getProductTotalCountBySearch(Search search, String prodType) throws Exception;
	
	
	
	// ==========================리뷰 기능
	public void addReview(HashMap<String, Object> hashMap) throws Exception;

	public void addReviewImage(HashMap<String, Object> hashMap) throws Exception;

	public List<Review> getReview(int prodNo) throws Exception;
	
	
	

	

	

	



	
}
