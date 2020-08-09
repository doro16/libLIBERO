package com.libero.service.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.libero.common.Search;
import com.libero.service.domain.Product;
import com.libero.service.domain.Review;

public interface ProductDAO {

	//public Product getProduct(int prodNo) throws Exception;
	
	public List<Product> getBookList(Search search) throws Exception;

	public List<Product> getProductList(String prodType, Search search) throws Exception;
	
	public int getProductTotalCount(String prodType) throws Exception;

	public Product getProduct(int prodNo);

	public void addReview(HashMap<String, Object> hashMap);

	public void addReviewImage(HashMap<String, Object> hashMap);

	public List<Review> getReview(int prodNo);
	
	public List<Product> getBookListBySearch(Search search);

	public int getBookTotalCount() throws Exception;

	public List<Product> getBookList();

	public List<Product> getBookListByCategory(String category, Search search);

	public int getBookTotalCount(String category) throws Exception;

	public int getBookTotalCountBySearch(Search search) throws Exception;

	


	
	
}
