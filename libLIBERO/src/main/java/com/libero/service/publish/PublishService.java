package com.libero.service.publish;

import java.util.List;
import java.util.Map;

import com.libero.common.Search;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Publish;
import com.libero.service.domain.User;

public interface PublishService {
	
	public Map<String,Object> getPrintOptionList() throws Exception;
	
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
	
	public Map<String, Object> getUserPublishList(Publish publish, Search search) throws Exception;
	
	public void removeTempPublish(int prodNo) throws Exception;
	
	public Cash getUserCash(String userId) throws Exception;
	
	public void addHashtag(int prodNo, List<String> hashtagName) throws Exception;
	
	public List<String> getHashtagList(int prodNo) throws Exception;

}
