package com.libero.service.publish;

import java.util.List;

import com.libero.service.domain.Cash;
import com.libero.service.domain.Publish;
import com.libero.service.domain.Statistics;
import com.libero.service.domain.User;

public interface PublishDAO {
	
	public List<User> getPrintOptionList() throws Exception;
	
	public int addPrintOption(Publish publish) throws Exception;
	
	public void updateManu(Publish publish) throws Exception;
	
	public void updatePublishInfo(Publish publish) throws Exception;
	
	public void updateRetailPrice(Publish publish) throws Exception;
	
	public void addProduct(Publish publish) throws Exception;
	
	public Publish getProduct(int prodNo) throws Exception;
	
	public void updateProduct(Publish publish) throws Exception;
	
	public void addOptionPrice() throws Exception;
	
	public User getOptionPrice(String userId) throws Exception;
	
	public void updateOptionPrice(User user) throws Exception;
	
	public List<Publish> getUserPublishList(Publish publish) throws Exception;
	
	public void removeTempPublish(Publish publish) throws Exception;
	
	public int getTotalCount(Publish publish) throws Exception;
	
	public List<Statistics> getStatistics(Statistics statistics) throws Exception;
	
	public Cash getUserCash(String userId) throws Exception;

}
