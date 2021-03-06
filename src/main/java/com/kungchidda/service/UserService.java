package com.kungchidda.service;

import java.util.Date;

import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;
	public UserVO refresh(LoginDTO dto) throws Exception;
	public void keepLogin(String uid, String sessionId, Date next) throws Exception;
	public UserVO checkLoginBefore(String value);
	
	public void join(UserVO user) throws Exception;
	
	public void modify(UserVO user) throws Exception;
	
	public int existAccount(UserVO vo) throws Exception;
	
	public int auth(String uid, String authKey) throws Exception;
	
	public void forgotPassword(String uid) throws Exception;
	public int forgotPasswordCheck(String uid) throws Exception;
}
