package com.libero.service.product.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.common.Search;
import com.libero.service.domain.Buy;
import com.libero.service.domain.Product;
import com.libero.service.domain.Review;
import com.libero.service.product.ProductDAO;


@Repository("productDAOImpl")
public class ProductDAOImpl implements ProductDAO{
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
					this.sqlSession = sqlSession;
	}

	@Override
	public List<Product> getBookList() throws Exception{
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("ProductMapper.getBookList");
	}

	@Override
	public List<Product> getBookListByCategory(String category) {
		System.out.println("DAOImpl.getBookListByCategory : "+category);
		
	   return sqlSession.selectList("ProductMapper.getBookListByCategory", category);
	}
	
	@Override
	public List<Product> getProductList(String prodType, Search search) {
		System.out.println("DAOImpl.getBookListByCategory : "+prodType);
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		//OFFSET 값 계산
		int offset = (search.getCurrentPage()-1)*(search.getPageSize());
		if(offset == -1) {
			hashMap.put("offset", 0);
		}else {
			hashMap.put("offset", offset);
		}

		hashMap.put("prodType", prodType);
		hashMap.put("search", search);

	   return sqlSession.selectList("ProductMapper.getProductList", hashMap);
	}
	
	@Override
	public Product getProduct(int prodNo) {
		System.out.println("ProductDAOImpl.getBook : "+prodNo);
		
	   return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public void addReview(HashMap<String, Object> hashMap) {
		
		Product product = sqlSession.selectOne("ProductMapper.getProdNo", hashMap);
		int prodNo = product.getProdNo();
		hashMap.put("prodNo", prodNo);
		sqlSession.insert("ProductMapper.addReview", hashMap);
	}
	
	@Override
	public void addReviewImage(HashMap<String, Object> hashMap) {
		sqlSession.update("ProductMapper.addReviewImage", hashMap);
	}

	@Override
	public List<Review> getReview(int prodNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("ProductMapper.getReview", prodNo);
	}
	
	public List<Product> getBookListBySearch(Search search){
		
		return sqlSession.selectList("ProductMapper.getBookListBySearch", search);
		
	}

	@Override
	public int getProductTotalCount(String prodType) throws Exception {
		
		return sqlSession.selectOne("ProductMapper.getProductTotalCount", prodType);
	}
}//end class