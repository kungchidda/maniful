package com.kungchidda.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.TitleVO;

@Repository
public class TitleDAOImpl implements TitleDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kungchidda.mappers.titleMapper";
	
	@Override
	public void create(TitleVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	@Override
	public void insertGenre(TitleVO vo) throws Exception {
		session.insert(namespace+".insertGenre", vo);
	}
	@Override
	public void modifyGenre(TitleVO vo) throws Exception {
		session.insert(namespace+".modifyGenre", vo);
	}
	@Override
	public void deleteGenre(TitleVO vo) throws Exception {
		session.insert(namespace+".deleteGenre", vo);
	}
	
	@Override
	public void add(TitleVO vo) throws Exception {
		session.insert(namespace+".add", vo);
	}
	
	@Override
	public TitleVO read(Integer tno) throws Exception {
		return session.selectOne(namespace+".read", tno);
	}
	
	@Override
	public void update(TitleVO vo) throws Exception {
		session.update(namespace +".update", vo);
	}
	
	@Override
	public void delete(Integer tno) throws Exception {
		session.delete(namespace+".delete", tno);
	}
	
	@Override
	public List<TitleVO> listSearch(SearchCriteria cri) throws Exception{
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
	public void addAttach(String titleFullName) throws Exception{
		session.insert(namespace+".addAttach", titleFullName);
	}
	
	@Override
	public List<BoardVO> getAttach(Integer tno) throws Exception {
		return session.selectList(namespace+".getAttach", tno);
	}
	
	@Override
	public void deleteAttach(Integer tno) throws Exception{
		session.delete(namespace+".deleteAttach", tno);
	}
	
	@Override
	public void deleteBoardAll(Integer tno) throws Exception{
		session.delete(namespace+".deleteReplyAll", tno);
	}
	
	@Override
	public void replaceAttach(String titleFullName, Integer tno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("tno", tno);
		paramMap.put("titleFullName", titleFullName);
		
		session.insert(namespace+".replaceAttach", paramMap);
	}
	
}
