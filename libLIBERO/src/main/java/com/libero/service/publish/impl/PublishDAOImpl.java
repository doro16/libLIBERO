package com.libero.service.publish.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.common.Search;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Publish;
import com.libero.service.domain.User;
import com.libero.service.publish.PublishDAO;

@Repository("publishDAOImpl")
public class PublishDAOImpl implements PublishDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public PublishDAOImpl() {
		System.out.println(this.getClass());
	}
	
	//method
	public List<User> getPrintOptionList() throws Exception {
		return sqlSession.selectList("PublishMapper.getPrintOptinList");
	}
	
	public int addPrintOption(Publish publish) throws Exception {
		if (publish.getProdType().contentEquals("paper")) {
			sqlSession.insert("PublishMapper.addPaper", publish);
		}
		if (publish.getProdType().contentEquals("ebook")) {
			sqlSession.insert("PublishMapper.addEbook", publish);
		}
		
		return sqlSession.selectOne("PublishMapper.getPublishNo", publish);
	}
	
	public void updateManu(Publish publish) throws Exception {
		sqlSession.update("PublishMapper.updateManu", publish);
	}
	
	public void updatePublishInfo(Publish publish) throws Exception {
		sqlSession.update("PublishMapper.updateProductInfo", publish);
	}
	
	@Override
	public void addHashtag(int prodNo, List<String> hashtagName) throws Exception {
		Map<String,Object> map = new HashMap();
		map.put("prodNo",prodNo);
		
		for(int i=0;i<hashtagName.size();i++) {
			map.put("hashtagName", hashtagName.get(i));
			System.out.println(map.get("hashtagName"));
			sqlSession.insert("PublishMapper.addHashtag",map);
		}
	}
	
	public void updateHashtag(Publish publish) throws Exception {
		sqlSession.update("PublishMapper.updateHashtag", publish);
	}
	
	public void updateRetailPrice(Publish publish) throws Exception {
		sqlSession.update("PublishMapper.updateRetailPrice", publish);	
	}
	
	public void addProduct(Publish publish) throws Exception{
		sqlSession.insert("PublishMapper.addProduct",publish);
	}
	
	public Publish getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("PublishMapper.getProduct",prodNo);
	}
	
	public void updateProduct(Publish publish) throws Exception{
		sqlSession.update("PublishMapper.updateProduct", publish);
	}
	
	public User getOptionPrice(String userId) throws Exception{
		return sqlSession.selectOne("PublishMapper.getOptionPrice", userId);
	}
	
	public void updateOptionPrice(User user) throws Exception{
		sqlSession.update("PublishMapper.updateOptionPrice", user);
	}
	
	public List<Publish> getUserPublishList(Publish publish, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("publish", publish);
		return sqlSession.selectList("PublishMapper.getUserPublishList", map);
	}
	
	public void removeTempPublish(int prodNo) throws Exception {
		sqlSession.delete("PublishMapper.removeTempPublish", prodNo);
	}
	
	public int getTotalCount(Publish publish) throws Exception {
		return sqlSession.selectOne("PublishMapper.getTotalCount", publish);
	}
	
	public Cash getUserCash(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserCash", userId);
	}

	@Override
	public List<String> getHashtagList(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("PublishMapper.getHashtagList", prodNo);
	}

	@Override
	public void removeHashtag(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("PublishMapper.removeHashtag", prodNo);
	}

}
