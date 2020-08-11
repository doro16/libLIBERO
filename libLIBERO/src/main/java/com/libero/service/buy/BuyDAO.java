package com.libero.service.buy;

import java.util.List;
import java.util.Map;

import com.libero.service.domain.Buy;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Pay;
import com.libero.service.domain.Product;

public interface BuyDAO {

	public List getUserBuy(Map userPayMap);
	
	public Pay addBuy(Pay pay);
	
	public List<Pay> getUserBuyList(String userId);
	
//	public List getUserProdNo(Map forProdNo);
	
	public List getFactoryBuyList();
	
//	public List getFactoryProdNo(String payNo);
	
	public List getFactoryBuy(String payNo);
	
	public boolean updateDeliveryStatus(String payNo, int deliveryStatus);
	
	public Pay getAllBuy(String payNo);
	
	public int getBuyArray(int buyNo);
	
	public int getBuyAmount(int buyNo);
	
	public void updateBuyStatus(int buyNo, String payNo);
	
	public List<Product> listProdAuthor(String payNo);
	
	public void addCash(Cash cash);
	
	public boolean getReviewFlag(String userId, int buyNo);
	
}
