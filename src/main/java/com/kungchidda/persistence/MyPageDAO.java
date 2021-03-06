package com.kungchidda.persistence;

import java.util.List;
import com.kungchidda.domain.MyPageVO;
//import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.SubscribeVO;
import com.kungchidda.domain.UserVO;

public interface MyPageDAO {
	
	public void create(MyPageVO vo) throws Exception;
	public void add(MyPageVO vo) throws Exception;
	public MyPageVO read(Integer bno) throws Exception;
	public void update(UserVO user) throws Exception;
	public void delete(Integer bno) throws Exception;
	public List<MyPageVO> listSearch(String uid, SearchCriteria cri) throws Exception;
	public List<MyPageVO> listSubscribedSearch(String uid, SearchCriteria cri) throws Exception;
	public List<SubscribeVO> listSubscriberSearch(String uid, SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCnt(Integer bno, int amount) throws Exception;
	public void updateViewCnt(Integer bno) throws Exception;
	
	public void addAttach(String fullName) throws Exception;
	
	public List<String> getAttach(Integer uno) throws Exception;
	
	public void deleteAttach(Integer uno) throws Exception;
	public void replaceAttach(String fullName, Integer uno) throws Exception;
	
	public void deleteReplyAll(Integer bno) throws Exception;
	
	public void updateLikeCnt(Integer bno) throws Exception;
	
	public UserVO setting(String uid) throws Exception;

}
