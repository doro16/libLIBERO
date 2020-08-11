
package com.libero.service.buy.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.service.buy.BuyDAO;
import com.libero.service.buy.BuyService;
import com.libero.service.domain.Buy;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Pay;
import com.libero.service.domain.Product;
import com.libero.service.product.ProductDAO;

@Service("buyServiceImpl")
public class BuyServiceImpl implements BuyService{
	
	//Field
	@Autowired
	@Qualifier("buyDAOImpl")
	private BuyDAO buyDao;
	@Autowired
	@Qualifier("productDAOImpl")
	private ProductDAO productDao;
	
	public void setProductDao(ProductDAO prodDao) {
		
		this.productDao = productDao;
	}
	
	public void setBuyDao(BuyDAO buyDao) {
		this.buyDao=buyDao;
	}
	
	//Constructor
	public BuyServiceImpl() {
		// TODO Auto-generated constructor stub
	}

//	@Override
//	public void removeBuy() {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public void getPayStatus() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePayStatus() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getDeliveryStatus() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateDeliveryStatus(String payNo, int deliveryStatus) {
		// TODO Auto-generated method stub
		buyDao.updateDeliveryStatus(payNo,deliveryStatus);
		Pay afterPayNo = buyDao.getAllBuy(payNo);
		
	return afterPayNo.getDeliveryStatus();
	}

	@Override
	public void addCancelation() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pay addBuy(Pay pay) {
		return	buyDao.addBuy(pay);
	}

	@Override
	public Map<String,Object> getUserBuy(String userId, String payNo) {
		
		Map<String,Object> map = new HashMap();
		Map<String,Object> userPayMap = new HashMap();
		
		userPayMap.put("payNo",payNo);
		userPayMap.put("userId",userId);
		List buyList = buyDao.getUserBuy(userPayMap);
		List prodList = new ArrayList();
		
		
		for(int i=0;i<buyList.size();i++) {
			Buy buy = new Buy();
			Product prod = new Product();
			buy = (Buy)buyList.get(i);
			buy.getProdNo();
			
			System.out.println("======================buyNO,id\n\n\n\n"+buy.getBuyerId()+"\n"+buy.getBuyNo()+"\n\n\n=======================");
			prod = productDao.getProduct(buy.getProdNo());
			prod.setBuyNo(buy.getBuyNo());
			//System.out.println("======================\n\n\n\n"+prod+"\n\n\n=======================");
			prod.setBuyAmount(buy.getBuyAmount());
			prod.setReviewFlag(buyDao.getReviewFlag(buy.getBuyerId(), buy.getBuyNo()));
			
			
			System.out.println("======================product\n\n\n\n"+prod+"\n\n\n=======================");
			prodList.add(prod);
			prodList.get(i);
			
		}
		
		map.put("userProduct",prodList);
		
		map.put("payList",buyList);
	
		 return map;
	}


	@Override
	public Map<String, Object> getUserBuyList(String userId) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
//		Map forProdNo = new HashMap();
//		buyDao.getUserProdNo(userId,payNo)
		System.out.println("\n\n\n****"+userId+"***\n\n\n");
		
//		forProdNo.put("userId", userId);
//		forProdNo.put("payNo",payNo);
		
//		map.put("prodNo",buyDao.getUserProdNo(forProdNo));//null -> getProdNo으로 교체 아마 prodNo 도 list로 받을듯
		map.put("list",buyDao.getUserBuyList(userId));
		
		return map;
	}

	@Override
	public Map<String, Object> getFactoryBuy(String payNo) {
		System.out.println("BUYSERVICEIMPL!!");System.out.println("BUYSERVICEIMPL!!");System.out.println("BUYSERVICEIMPL!!");
		List buyList = new ArrayList();
		List prodList = new ArrayList();
		Map map= new HashMap();
		
		buyList = buyDao.getFactoryBuy(payNo);
		

			for(int i=0;i<buyList.size();i++) {
				Buy buy = new Buy();
				Product prod = new Product();
				buy = (Buy)buyList.get(i);
				prod = productDao.getProduct(buy.getProdNo());
				prod.setBuyAmount(buy.getBuyAmount());
				System.out.println("====\n\n\n"+prod+"\n\n\n====");
				prodList.add(prod);
			}
			System.out.println("prodList\n\n\n"+prodList+"\n\n\n");
			map.put("product",prodList);
			
			return map;
		
	}

	@Override
	public Map<String, Object> getFactoryBuyList() {
		// TODO Auto-generated method stub
		Map map = new HashMap();

		map.put("factorylist", buyDao.getFactoryBuyList());
//		map.put("factoryProdNo", buyDao.getFactoryProdNo(payNo));
		
		return map;
	}

	@Override
	public int getBuyArray(int buyNo) {
		// TODO Auto-generated method stub
		
		
		return buyDao.getBuyArray(buyNo);
	}

	@Override
	public int getBuyAmount(int buyNo) {
		
		return buyDao.getBuyAmount(buyNo);
	}
	
	public List<Product> listProdAuthor(String payNo){
		return buyDao.listProdAuthor(payNo);
	}
	
	public void addCash(Cash cash) {
		buyDao.addCash(cash);
	}
	
	@Override
	public void updateBuyStatus(int buyNo , String payNo) {
		// TODO Auto-generated method stub
		buyDao.updateBuyStatus(buyNo, payNo);
	}

//	@Override
//	public boolean getReviewFlag(String userId, int buyNo) {
//		
//		return buyDao.getReviewFlag(userId, buyNo);
//	}


}
