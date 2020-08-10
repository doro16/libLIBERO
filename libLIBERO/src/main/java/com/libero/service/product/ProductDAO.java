package com.libero.service.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.libero.common.Search;
import com.libero.service.domain.Product;
import com.libero.service.domain.Review;

public interface ProductDAO {
	
	public List<Product> getBookList(Search search) throws Exception;
	
	public List<Product> getBookListByCategory(String category, Search search) throws Exception;
	
	public List<Product> getBookListBySearch(Search search) throws Exception;
	
	public List<Product> getProductList(String prodType, Search search) throws Exception;
	
	public List<Product> getProductListBySearch(Search search, String prodType) throws Exception;
	
	public int getBookTotalCount() throws Exception;
	
	public int getBookTotalCount(String category) throws Exception;
	
	public int getBookTotalCountBySearch(Search search) throws Exception;
	
	public int getProductTotalCount(String prodType) throws Exception;
	
	public int getProductTotalCountBySearch(Search search, String prodType);
	
	public Product getProduct(int prodNo);
	
	//리뷰

	public void addReview(HashMap<String, Object> hashMap);

	public void addReviewImage(HashMap<String, Object> hashMap);

	public List<Review> getReview(int prodNo);
	
	//Main

	public List<Product> getBookList();


	

	

}
