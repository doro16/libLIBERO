
package com.libero.service.buy;

import java.util.Map;

import com.libero.service.domain.Pay;

public interface BuyService {
	
	//public void removeBuy(); -> addCancelation
	
	public void getPayStatus();
	
	public void updatePayStatus();
	
	public void getDeliveryStatus();
	
	public void updateDeliveryStatus();
	
	public void addCancelation();
	
	public Pay addBuy(Pay pay);
	
	public Map<String,Object> getUserBuy(String userId, String payNo);
	
	public Map<String,Object> getUserBuyList(String userId,String payNo);
	
	public Map<String,Object> getFactoryBuy(String payNo);
	
	public Map<String,Object> getFactoryBuyList(String payNo);
	
	//public void getPayStatus();
	
	//public void updatePayStatus();
}
