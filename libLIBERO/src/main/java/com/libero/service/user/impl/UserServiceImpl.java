package com.libero.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.common.Search;
import com.libero.service.domain.Cash;
import com.libero.service.domain.User;
import com.libero.service.user.UserDAO;
import com.libero.service.user.UserService;

//==> ȸ������ ���� ����
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	//Field
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	public void setUserDao(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	//Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	//method
	public User getUser(String userId) throws Exception {
		return userDAO.getUser(userId);
	}
	
	public User getUserByKakao(String userId) throws Exception{
		return userDAO.getUser(userId);
	}

	@Override
	public User addUser(User user) throws Exception {
		
		System.out.println("\n\n==================================");
		System.out.println("!!!USERSERVICEIMPL!!!");
		System.out.println("==================================\n\n");
		// TODO Auto-generated method stub
		userDAO.addUser(user);
		
		return null;
	}

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<User> list = userDAO.getUserList(search);
		int totalCount = userDAO.getUserTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public boolean duplicationCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		
		
		return userDAO.duplicationCheck(userId);
	}
	
	@Override
	public boolean duplicationNick(String nickname) throws Exception {
		
		return userDAO.duplicationNick(nickname);
	}
	
	@Override
	public List<String> addHashtag(String userId, List<String> hashtagName) throws Exception {
		// TODO Auto-generated method stub
		
		userDAO.addHashtag(userId, hashtagName);
		return null;
	}
	
	public Cash getCash(String userId) {
		return userDAO.getCash(userId);
	}
	
	public void updateCash(Cash cash) {
		userDAO.updateCash(cash);
	}
	
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDAO.updateUser(user);
	}
	
	public void requestCash(String userId, String cashCode) {
		userDAO.requestCash(userId, cashCode);
	}
	
	public void addKakaoId(String userId, String kakaoId) {
		userDAO.addKakaoId(userId, kakaoId);
	}
	
	public void delUser(String kEmail) {
		userDAO.delUser(kEmail);
	}

	@Override
	public void removeUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.removeUser(user);
	}
	public int updatePhoneCode(String userId) {
		
		return userDAO.updatePhoneCode(userId);
	}
	
	public void updateKakaoToUser(String userId, String kEmail) {
		userDAO.updateKakaoToUser(userId, kEmail);
	}
	
	public String findUserIdByPhone(String phone) {
		return userDAO.findUserIdByPhone(phone);
	}
	
	public void updatePassword(String userId, String verCode) {
		userDAO.updatePassword(userId, verCode);
	}
	
	public String getUserNickname(String userNickname) {
		return userDAO.getUserNickname(userNickname);
	}
}
