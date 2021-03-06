package com.libero.service.user;

import java.util.List;

import com.libero.common.Search;
import com.libero.service.domain.Cash;
import com.libero.service.domain.User;

public interface UserDAO {
	
	// SELECT ONE
	public User getUser(String userId) throws Exception ;
	
	public User getUserByKakao(String userId) throws Exception;
	
	public void addUser(User user) throws Exception;
	
	public List<User> getUserList(Search search) throws Exception;

	public boolean duplicationCheck(String userId) throws Exception;
	
	public boolean duplicationNick(String nickname) throws Exception;
	
	public int getUserTotalCount(Search search) throws Exception;
	
	public List<String> addHashtag(String userId, List<String> hashtagName) throws Exception;

	public void requestCash(String userId, String cashCode);
	
	public Cash getCash(String userId);
	
	public void updateCash(Cash cash);
	
	public void updateUser(User user);
	
	public int updatePhoneCode(String userId);
	
	public void addKakaoId(String userId, String kakaoId);
	
	public void delUser(String kEmail);
	
	public void removeUser(User user) throws Exception;

	public void updateKakaoToUser(String userId, String kEmail);
	
	public String findUserIdByPhone(String phone);
	
	public void updatePassword(String userId, String verCode);
	
	public String getUserNickname(String userNickname);
}
