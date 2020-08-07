package com.libero.service.publish.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.common.Search;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Publish;
import com.libero.service.domain.Report;
import com.libero.service.domain.User;
import com.libero.service.publish.PublishDAO;
import com.libero.service.publish.PublishService;

@Service("publishServiceImpl")
public class PublishServiceImpl implements PublishService{
	
	///Field
	@Autowired
	@Qualifier("publishDAOImpl")
	private PublishDAO publishDAO;
	public void setPublishDAO(PublishDAO publishDAO) {
		this.publishDAO = publishDAO;
	}
	
	///Constructor
	public PublishServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public Map<String,Object> getPrintOptionList() throws Exception{
		
		List<User> list= publishDAO.getPrintOptionList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		
		return map;
	}
	
	public int addPrintOption(Publish publish) throws Exception{
		return publishDAO.addPrintOption(publish);
	}
	
	public void updateManu(Publish publish) throws Exception{
		publishDAO.updateManu(publish);
	}
	
	public void updatePublishInfo(Publish publish) throws Exception{
		publishDAO.updatePublishInfo(publish);
	}
	
	public void updateRetailPrice(Publish publish) throws Exception{
		publishDAO.updateRetailPrice(publish);
	}
	
	public void addProduct(Publish publish) throws Exception{
		publishDAO.addProduct(publish);
	}
	
	public Publish getProduct(int prodNo) throws Exception{
		return publishDAO.getProduct(prodNo);
	}
	
	public void updateProduct(Publish publish) throws Exception{
		publishDAO.updateProduct(publish);
	}
	
	public void addOptionPrice() throws Exception{
		
	}
	
	public User getOptionPrice(String userId) throws Exception{
		return publishDAO.getOptionPrice(userId);
	}
	
	public void updateOptionPrice(User user) throws Exception{
		publishDAO.updateOptionPrice(user);
	}
	
	public Map<String, Object> getUserPublishList(Publish publish, Search search) throws Exception {
		
		int totalCount = publishDAO.getTotalCount(publish);
		List<Publish> list = publishDAO.getUserPublishList(publish, search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public void removeTempPublish(int prodNo) throws Exception {
		
		if (publishDAO.getHashtagList(prodNo)!=null) {
			publishDAO.removeHashtag(prodNo);
		}
		
		publishDAO.removeTempPublish(prodNo);
	}
	
	public Cash getUserCash(String userId) throws Exception {
		return publishDAO.getUserCash(userId);
	}

	@Override
	public void addHashtag(int prodNo, List<String> hashtagName) throws Exception {
		publishDAO.addHashtag(prodNo, hashtagName);
	}

	@Override
	public List<String> getHashtagList(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return publishDAO.getHashtagList(prodNo);
	}

}
