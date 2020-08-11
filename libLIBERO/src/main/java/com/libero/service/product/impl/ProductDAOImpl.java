package com.libero.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Product> getBookList(Search search) throws Exception{
		System.out.println("Is the DAOImpl.getBookList : ");
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		//OFFSET 값 계산
		int offset = (search.getCurrentPage()-1)*(search.getPageSize());
		System.out.println("오프셋은 "+offset);
				//첫번째 페이지는 pagesize 10개
				if(search.getCurrentPage() == 1) {
					search.setPageSize(10);
				}
					hashMap.put("offset", offset);
		
					hashMap.put("search", search);
		
		  return sqlSession.selectList("ProductMapper.getBookList", hashMap);
	}

	@Override
	public List<Product> getBookListByCategory(String category, Search search) {
		System.out.println("Is the DAOImpl.getBookListByCategory : "+category);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		//OFFSET 값 계산
		int offset = (search.getCurrentPage()-1)*(search.getPageSize());
		if(search.getCurrentPage() == 1) {
			search.setPageSize(10);
		}
			hashMap.put("offset", offset);

		hashMap.put("category", category);
		hashMap.put("search", search);

	   return sqlSession.selectList("ProductMapper.getBookListByCategory", hashMap);
	}
	
		public List<Product> getBookListBySearch(Search search){
				
				System.out.println("Is the DAOImpl.getBookListBySearch : "+search);
				HashMap<String, Object> hashMap = new HashMap<String, Object>();
				
						//OFFSET 값 계산
						int offset = (search.getCurrentPage()-1)*(search.getPageSize());
						if(search.getCurrentPage() == 1) {
							search.setPageSize(10);
						}
							hashMap.put("offset", offset);
		
							hashMap.put("search", search);
		
				return sqlSession.selectList("ProductMapper.getBookListBySearch", hashMap);
				
			}
	
	@Override
	public List<Product> getProductList(String prodType, Search search) {
		System.out.println("Is the DAOImpl.getProductList, prodType은 : "+prodType);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		//OFFSET 값 계산
				int offset = (search.getCurrentPage()-1)*(search.getPageSize());
				if(search.getCurrentPage() == 1) {
					search.setPageSize(10);
				}
					hashMap.put("offset", offset);
					hashMap.put("prodType", prodType);
					hashMap.put("search", search);

	   return sqlSession.selectList("ProductMapper.getProductList", hashMap);
	}
	
	@Override
	public List<Product> getProductListBySearch(Search search, String prodType) throws Exception {
		System.out.println("Is the DAOImpl.getProductListBySearch : "+search);
		System.out.println("Is the prodType 은 "+prodType);
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
				//OFFSET 값 계산
				int offset = (search.getCurrentPage()-1)*(search.getPageSize());
				if(search.getCurrentPage() == 1) {
					search.setPageSize(10);
				}
					hashMap.put("offset", offset);
					hashMap.put("prodType", prodType);
					hashMap.put("search", search);

		return sqlSession.selectList("ProductMapper.getProductListBySearch", hashMap);
	}
	
	@Override
	public Product getProduct(int prodNo) {
		System.out.println("Is the ProductDAOImpl.getProduct : "+prodNo);
		
	   return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public void addReview(HashMap<String, Object> hashMap) {
		System.out.println("Is the ProductDAOImpl.addReview : "+ hashMap);
		Product product = sqlSession.selectOne("ProductMapper.getProdNo", hashMap);
		int prodNo = product.getProdNo();
		hashMap.put("prodNo", prodNo);
		sqlSession.insert("ProductMapper.addReview", hashMap);
	}
	
	@Override
	public void addReviewImage(HashMap<String, Object> hashMap) {
		System.out.println("Is the ProductDAOImpl.addReviewImage " + hashMap);
		sqlSession.update("ProductMapper.addReviewImage", hashMap);
	}

	@Override
	public List<Review> getReview(int prodNo) {
		System.out.println("Is the ProductDAOImpl.getReview " + prodNo);
		
		return sqlSession.selectList("ProductMapper.getReview", prodNo);
	}
	
	@Override
	public int getBookTotalCount() throws Exception {
		
		return sqlSession.selectOne("ProductMapper.getBookTotalCount");
	}
	
	@Override
	public int getBookTotalCount(String category) throws Exception {
		
		return sqlSession.selectOne("ProductMapper.getBookTotalCountByCategory", category);
	}
	
	@Override
	public int getBookTotalCountBySearch(Search search) throws Exception {
		
		return sqlSession.selectOne("ProductMapper.getBookTotalCountBySearch", search);
	}
	
	@Override
	public int getProductTotalCount(String prodType) throws Exception {
		
		return sqlSession.selectOne("ProductMapper.getProductTotalCount", prodType);
	}
	
	@Override
	public int getProductTotalCountBySearch(Search search, String prodType) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("search", search);
		hashMap.put("prodType", prodType);
		return sqlSession.selectOne("ProductMapper.getProductTotalCountBySearch", hashMap);
	}

	@Override
	public List<Product> getBookList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ProductMapper.getBookListForMain");
	}

	

	
}//end class