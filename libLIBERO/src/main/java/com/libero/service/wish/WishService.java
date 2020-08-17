package com.libero.service.wish;

import java.util.HashMap;
import java.util.List;

import com.libero.service.domain.Product;

public interface WishService {
	
	public boolean addWish(HashMap<String, Object> hashMap) throws Exception;

	public boolean checkWish(HashMap<String, Object> hashMap) throws Exception;

	public List<Product> getWishList(String userId) throws Exception;

	public int countWish(String userId);

	
}