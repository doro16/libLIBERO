package com.libero.service.user;

import com.libero.service.domain.User;

public interface UserService {
	
	// ������Ȯ�� / �α���
	public User getUser(String userId) throws Exception;
}
