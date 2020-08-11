
package com.libero.service.buy;

import java.util.List;
import java.util.Map;

import com.libero.service.domain.Cash;
import com.libero.service.domain.Pay;
import com.libero.service.domain.Product;

public interface BuyService {
	
	//public void removeBuy(); -> addCancelation
	
	public void getPayStatus();
	
	public void updatePayStatus();
	
	public void getDeliveryStatus();
	
	public int updateDeliveryStatus(String payNo, int deliveryStatus);
	
	public void addCancelation();
	
	public Pay addBuy(Pay pay);
	
	public Map<String,Object> getUserBuy(String userId, String payNo);
	
	public Map<String,Object> getUserBuyList(String userId);
	
	public Map<String,Object> getFactoryBuy(String payNo);
	
	public Map<String,Object> getFactoryBuyList();
	
	public int getBuyArray(int buyNo);
	
	public int getBuyAmount(int buyNo);
	
	public void updateBuyStatus(int buyNo,String payNo);
	
	public List<Product> listProdAuthor(String payNo);
	
	public void addCash(Cash cash);	
	
//	public boolean getReviewFlag(String userId, int buyNo);
	
	//public void getPayStatus();
	
	//public void updatePayStatus();
}
