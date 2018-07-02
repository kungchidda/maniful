package com.kungchidda.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.userMapper";
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace +".login", dto);
	}
	
	@Override
	public void keepLogin(String uid, String sessionId, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		session.update(namespace+".keepLogin", paramMap);
		
	}
	
	@Override
	public UserVO checkUserWithSessionKey(String value) {
		return session.selectOne(namespace+".checkUserWithSessionKey", value);
	}

	@Override
	public void join(UserVO user) throws Exception {
		session.insert(namespace+".join", user);
	}
	
	@Override
	public void updateSubscribedCnt(String subscribed) throws Exception {
		session.update(namespace + ".updateSubscribedCnt", subscribed);
	}
	
	@Override
	public void updateSubscriberCnt(String subscriber) throws Exception {
		session.update(namespace + ".updateSubscriberCnt", subscriber);
	}
	
	@Override
	public void update(UserVO user) throws Exception {
		session.update(namespace +".update", user);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception{
		session.insert(namespace+".addAttach", fullName);
	}
	
	@Override
	public List<String> getAttach(Integer uno) throws Exception {
		return session.selectList(namespace+".getAttach", uno);
	}
	
	@Override
	public void deleteAttach(Integer uno) throws Exception{
		session.delete(namespace+".deleteAttach", uno);
	}
	
	@Override
	public void replaceAttach(String fullName, Integer uno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("fullName", fullName);
		paramMap.put("uno", uno);
		
		session.insert(namespace+".replaceAttach", paramMap);
	}
	
	@Override
	public void insertGenre(UserVO user) throws Exception{
		session.insert(namespace+".insertGenre", user);
	}
	@Override
	public void deleteGenre(UserVO user) throws Exception{
		session.delete(namespace+".deleteGenre", user);
	}
}
