
package com.libero.service.buy.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.buy.BuyDAO;
import com.libero.service.domain.Buy;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Pay;
import com.libero.service.domain.Product;

@Repository("buyDAOImpl")
public class BuyDAOImpl implements BuyDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void SqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Pay> getUserBuy(Map userPayMap) {
		System.out.println("BuyDaoImpl 도착");		
		return sqlSession.selectList("BuyMapper.getUserBuy",userPayMap);
	}
	@Override
	public Pay addBuy(Pay pay) {
		// TODO Auto-generated method stub
		System.out.println("BuyDaoImpl 도착 : addBuy() ");
		sqlSession.insert("BuyMapper.addBuy",pay);
		
	//	sqlSession.selectOne("BuyMapper.nextAdd");
	//	System.out.println("\n\n1번 pay"+pay.getPayNo());
		
//		pay=sqlSession.selectOne("BuyMapper.getBuy")
//		pay.setPayNo();
		
		
		//pay = sqlSession.selectOne("BuyMapper.getBuy",pay);
		System.out.println("\n\n [[pay보자]] : "+pay+"\n\n");
		return pay;
	}

	@Override
	public List getUserBuyList(String userId) {
		// TODO Auto-generated method stub
		System.out.println("\n\n[[ "+userId+" ]] \n\n");
		return sqlSession.selectList("BuyMapper.getUserBuyList",userId);
		
	}

//	@Override
//	public List getUserProdNo(Map forProdNo) {
//		// TODO Auto-generated method stub
//		
//		forProdNo.get("userId");
//		forProdNo.get("payNo");
//		return sqlSession.selectList("BuyMapper.getUserProdNo",forProdNo);
//	}

	@Override
	public List getFactoryBuyList(String factoryId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BuyMapper.getFactoryBuyList",factoryId);
	}

	@Override
	public List getFactoryBuy(String payNo,String factoryId) {
		Map map = new HashMap();
		map.put("factoryId", factoryId);
		map.put("payNo", payNo);
		
		return sqlSession.selectList("BuyMapper.getFactoryBuy", map);
	}

	@Override
	public boolean updateDeliveryStatus(String payNo, int deliveryStatus) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("payNo", payNo);
		map.put("deliveryStatus", deliveryStatus);
		
		int result =sqlSession.update("BuyMapper.updateDeliveryStatus", map);
		if(result == -1 ){
			return false;
		}else {
			return true;
		}
		 
	}

	public Pay getAllBuy(String payNo) {
		return sqlSession.selectOne("BuyMapper.getAllBuy",payNo);
	}

	@Override
	public int getBuyArray(int buyNo) {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectOne("BuyMapper.getProdNo", buyNo);
	}

	@Override
	public int getBuyAmount(int buyNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BuyMapper.getBuyAmount",buyNo);
	}
	
	@Override
	public void updateBuyStatus(int buyNo, String payNo) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("buyNo", buyNo);
		map.put("payNo", payNo);
		
		sqlSession.update("BuyMapper.updateBuyStatus",map);
	}
	
	public List<Product> listProdAuthor(String payNo){
		return sqlSession.selectList("UserMapper.listProdAuthor", payNo);
	}
	
	public void addCash(Cash cash) {
		sqlSession.insert("UserMapper.addCash", cash);
	}
	
	public boolean getReviewFlag(String userId , int buyNo) {
		Map map = new HashMap();
		map.put("userId",userId);
		map.put("buyNo", buyNo);
		String result = sqlSession.selectOne("BuyMapper.getReviewFlag",map);
		System.out.println("=====================\n\n"+result+"\n\n=================");
		if(result == null ) {
			return false;//리뷰 없음
		}else {
			return true;// 리뷰 있음
		}
		
	}
//	@Override
//	public List getFactoryProdNo(String payNo) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("BuyMapper.getFactoryProdNo",payNo);
//	}
//	

}