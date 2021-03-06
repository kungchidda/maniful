package com.kungchidda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
//import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.boardMapper";
	
	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
//	@Override
//	public void add(BoardVO vo) throws Exception {
//		session.insert(namespace+".add", vo);
//	}
	
	@Override
	public BoardVO read(Integer bno) throws Exception {
		return session.selectOne(namespace+".read", bno);
	}
	
	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace +".update", vo);
	}
	
	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete", bno);
	}
	
//	@Override
//	public List<BoardVO> listAll() throws Exception {
//		return session.selectList(namespace+".listAll");
//	}
//	
//	@Override
//	public List<BoardVO> listPage(int page) throws Exception {
//		if(page<=0) {
//			page=1;
//		}
//		page=(page-1)*10;
//		
//		return session.selectList(namespace+".listPage", page);
//	}
//	
//	@Override
//	public List<BoardVO> listCriteria(Criteria cri) throws Exception{
//		return session.selectList(namespace+".listCriteria", cri);
//	}
//	
//	@Override
//	public int countPaging(Criteria cri) throws Exception {
//		return session.selectOne(namespace+".countPaging", cri);
//	}
	
	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception{
		return session.selectList(namespace + ".listSearch", cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateReplyCnt", paramMap);
	}
	
	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		
		session.update(namespace + ".updateViewCnt", bno);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception{
		session.insert(namespace+".addAttach", fullName);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return session.selectList(namespace+".getAttach", bno);
	}
	
	@Override
	public void deleteAttach(Integer bno) throws Exception{
		session.delete(namespace+".deleteAttach", bno);
	}
	
	@Override
	public void deleteReplyAll(Integer bno) throws Exception{
		session.delete(namespace+".deleteReplyAll", bno);
	}
	
	@Override
	public void replaceAttach(String boardFullName, Integer bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("boardFullName", boardFullName);
		
		session.insert(namespace+".replaceAttach", paramMap);
	}
	
	
	@Override
	public void updateLikeCnt(Integer bno) throws Exception {
		session.update(namespace + ".updateLikeCnt", bno);
	}
	
	@Override
	public List<BoardVO> listPage(Integer tno, Criteria cri, String uid) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("tno", tno);
		paramMap.put("cri", cri);
		paramMap.put("uid", uid);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}

	
	@Override
	public List<BoardVO> mylistPage(Integer tno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("tno", tno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".mylistPage", paramMap);
	}
	
	
	@Override
	public int count(Integer tno) throws Exception {
		return session.selectOne(namespace + ".count", tno);
	}
	@Override
	public int mycount(Integer tno) throws Exception {
		return session.selectOne(namespace + ".mycount", tno);
	}
	
	@Override
	public int checkUserRead(Integer bno, String uid) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("uid", uid);
		
		return session.selectOne(namespace + ".checkUserRead", paramMap);
	}
	
	@Override
	public void insertUserRead(Integer bno, String uid) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("uid", uid);
		session.insert(namespace+".insertUserRead", paramMap);
	}
	
	@Override
	public void readComplete(BoardVO vo) throws Exception {
		session.update(namespace + ".readComplete", vo);
	}
	
	@Override
	public void addTags(Integer bno, String tag) throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("tag", tag);
		session.insert(namespace+".addTags", paramMap);
	}
	
	@Override
	public void deleteTags(Integer bno) throws Exception{
		session.delete(namespace+".deleteTags", bno);
	}
	

	
	@Override
	public BoardVO checkContent(Integer bno) throws Exception {
		return session.selectOne(namespace + ".checkContent", bno);
	}
	
}
