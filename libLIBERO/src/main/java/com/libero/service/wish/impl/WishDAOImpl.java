package com.libero.service.wish.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.domain.Product;
import com.libero.service.wish.WishDAO;

@Repository("wishDAOImpl")
public class WishDAOImpl implements WishDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public List<Product> getWishList(String userId) {
			System.out.println("여기는 wishDAOImpl.getWishList 가져온것은"+userId);
			return sqlSession.selectList("ProductMapper.getWishList", userId);
	}
	
	public String checkWish(HashMap<String, Object> hashMap) {
		System.out.println("여기는 wishDAOImpl.checkWishList 가져온것은"+hashMap);

		if (sqlSession.selectOne("ProductMapper.checkWish", hashMap) != null) {
			return Integer.toString(sqlSession.selectOne("ProductMapper.checkWish", hashMap)); //수린 int to String
		}else {
			return null;
		}	
	}
	
	@Override
	public void addWish(HashMap<String, Object> hashMap) {
			sqlSession.insert("ProductMapper.addWish", hashMap);
	}
	
	@Override
	public void removeWish(HashMap<String, Object> hashMap) {
			sqlSession.delete("ProductMapper.removeWish", hashMap);
	}
	@Override
	public int countWish(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ProductMapper.countWish", userId);
	}
	
}
