package com.libero.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.libero.common.Search;
import com.libero.service.domain.Cash;
import com.libero.service.domain.User;
import com.libero.service.user.UserDAO;

@Repository("userDAOImpl")
public class UserDAOImpl implements UserDAO {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Value("#{userProperties['listTable']}")
	String[] listTable;
	
	///Constructor
	public UserDAOImpl() {
		System.out.println(this.getClass());
	}
	//method
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	
	public User getUserByKakao(String userId) throws Exception{
		return sqlSession.selectOne("UserMapper.getUserByKakao", userId);
	}

	@Override
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addNewUser",user);
		
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("UserMapper.getUserList",search);
	}

	@Override
	public boolean duplicationCheck(String userId)  throws Exception{
		
		String result = sqlSession.selectOne("UserMapper.duplicationCheck", userId);
		System.out.println("서연희____result = " + result);
		if(result!=null) {
			System.out.println("dksdls vws");
			return false;
		}else {
			System.out.println("널입니다...\n\n\n\n\n");
			return true;
		}
			
	}

	@Override
	public boolean duplicationNick(String nickname) throws Exception {
		// TODO Auto-generated method stub
		String result= sqlSession.selectOne("UserMapper.duplicationNick",nickname);
		if(result!=null) {
			System.out.println("널이 아닐때 이이이이잉");
			return false;
		}else {
			return true;
		}
		
	}
	
	@Override
	public List<String> addHashtag(String userId, List<String> hashtagName) throws Exception {
			
		Map map = new HashMap();
		map.put("userId",userId);
		
		for(int i=0;i<hashtagName.size();i++) {
			String hashtag = hashtagName.get(i);
			map.put("hashtagName", hashtag);
			sqlSession.insert("UserMapper.addHashTag",map);
		}
		return null;
	}
	
	@Override
	public int getUserTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.getUserTotalCount", search);
	}
	
	public void requestCash(String userId, String cashCode) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("cashCode", cashCode);
		
		sqlSession.update("UserMapper.requestCash", map);
	}
	
	public Cash getCash(String userId) {
		return sqlSession.selectOne("UserMapper.getCash", userId);
	}
	
	public void updateCash(Cash cash) {
		sqlSession.insert("UserMapper.updateCash", cash);
	}
	
	public void addKakaoId(String userId, String kakaoId) {
		Map<String, String> map = new HashMap();
		map.put("userId", userId);
		map.put("kakaoId", kakaoId);
		
		sqlSession.update("UserMapper.addKakaoId", map);
	}
	
	public void delUser(String kEmail) {
		sqlSession.delete("UserMapper.delUser", kEmail);
	}
	
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		sqlSession.update("UserMapper.updateUser",user);
	}

	@Override
	public int updatePhoneCode(String userId) {
		
		return sqlSession.update("UserMapper.updatePhoneCode",userId);
	}



	@Override
	public void removeUser(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UserMapper.removeUser", user);
		
	}
	
	public void updateKakaoToUser(String userId, String kEmail) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("kEmail", kEmail);
		
		for(int i=0; i<listTable.length; i++) {
			sqlSession.update("UserMapper.updateUserFrom"+listTable[i], map);
		}
	}
	
	public String findUserIdByPhone(String phone) {
		return sqlSession.selectOne("UserMapper.findUserIdByPhone", phone);
	}
	
	public void updatePassword(String userId, String verCode) {
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("userId", userId);
		map.put("verCode", verCode);
		
		sqlSession.update("UserMapper.updatePassword", map);
	}

}
