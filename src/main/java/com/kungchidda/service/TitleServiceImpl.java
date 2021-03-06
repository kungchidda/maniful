package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.TitleVO;
import com.kungchidda.persistence.TitleDAO;

@Service
public class TitleServiceImpl implements TitleService{

	@Inject
	private TitleDAO dao;
	
	@Transactional
	@Override
	public void regist(TitleVO title) throws Exception{
		
		dao.create(title);
		
		String[] files = title.getFiles();
		
		if(files != null) {
			for(String titleFullName : files) {
				dao.addAttach(titleFullName);
			}
		}
		//dao.add(title);
		dao.insertGenre(title);
	}
	

	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public TitleVO read(Integer tno) throws Exception{
		return dao.read(tno);
	}

	@Transactional
	@Override
	public void modify(TitleVO title) throws Exception{
		dao.update(title);
		Integer tno = title.getTno();
		
		
		String[] files = title.getFiles();
		
		if(files !=null) {
			dao.deleteAttach(tno);
			for(String fileName : files) {
				dao.replaceAttach(fileName, tno);
			}
		}
		if(title.getGenreArr() != null) {
			dao.deleteGenre(title);
			dao.modifyGenre(title);
		}
	}
	
	@Transactional
	@Override
	public void remove(Integer tno) throws Exception{
		dao.deleteAttach(tno);
		dao.deleteBoardAll(tno);
		dao.delete(tno);
	}
	
	
	@Override
	public List<TitleVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return dao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	@Override
	public List<BoardVO> getAttach(Integer tno) throws Exception{
		return dao.getAttach(tno);
	}
}
