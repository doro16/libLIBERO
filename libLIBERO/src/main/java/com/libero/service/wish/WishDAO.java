package com.libero.service.wish;

import java.util.HashMap;
import java.util.List;

import com.libero.service.domain.Product;

public interface WishDAO {
	
	public List<Product> getWishList(String userId);

	public void addWish(HashMap<String, Object> hashMap);

	public void removeWish(HashMap<String, Object> hashMap);

	public String checkWish(HashMap<String, Object> hashMap);

	public int countWish(String userId);



	
}
