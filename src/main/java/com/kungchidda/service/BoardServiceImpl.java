package com.kungchidda.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.BoardVO;
import com.kungchidda.domain.Criteria;
import com.kungchidda.domain.NotifyVO;
import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.domain.SubscribeVO;
import com.kungchidda.domain.UserVO;
import com.kungchidda.persistence.BoardDAO;
import com.kungchidda.persistence.NotifyDAO;
import com.kungchidda.persistence.PayDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Inject
	private BoardDAO dao;
	
	@Inject
	private NotifyDAO notifyDAO;
	
	@Inject
	private PayDAO payDAO;
	
	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception{
		dao.create(board);
		int bno = notifyDAO.getLastInsertBno(board.getUid());
		
		String[] files = board.getFiles();
		NotifyVO notifyVO = new NotifyVO();
		BoardVO boardVO = new BoardVO();
		UserVO userVO = new UserVO();
		SubscribeVO subscribeVO = new SubscribeVO();
		String[] tags = board.getTags();
		
		if(files != null) {
			for(String fileName : files) {
				dao.addAttach(fileName);
				notifyVO.setNotifyThumbnail(fileName);
			}
		}
		
		if(tags != null) {
			for(String tag : tags) {
				dao.addTags(bno, tag);
			}
		}
		
		userVO.setUid(board.getUid());
		userVO = notifyDAO.checkUserForNotify(userVO);
		
		boardVO.setBno(board.getBno());
		boardVO = notifyDAO.checkBoardForNotify(boardVO);
		
		notifyVO.setSender(board.getUid());
		notifyVO.setType("bno");
		
		notifyVO.setContents(userVO.getUname() + "님의 " + board.getTitle() + " - " + board.getSubtitle() + "이 등록 되었습니다.");
		notifyVO.setUrl("/sboard/readPage?bno="+bno);
		subscribeVO.setSubscribed(board.getUid());
		List<SubscribeVO> subList = notifyDAO.checkSubscriberForNotify(subscribeVO);
		
		for(SubscribeVO subscriber : subList) {
		    String uid = subscriber.getSubscriber();
		    notifyVO.setReceiver(uid);
		    if(!notifyVO.getSender().equals(notifyVO.getReceiver())) {
				notifyDAO.create(notifyVO);
			}
		}


		
		
		
	}
	

	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO userRead(Integer bno, String uid) throws Exception{
		
		
		BoardVO boardVO = new BoardVO();
		
		boardVO = dao.checkContent(bno);
		
		int point = boardVO.getPoint();
		String author = boardVO.getUid();
		
		if(!author.equals(uid)) {
			if(point > 0) {
				
				int buy = payDAO.checkUserBuy(bno, uid);
				if(buy == 0) {
					PayVO buyer = new PayVO();
					PayVO seller = new PayVO();
					
					buyer.setUid(uid);
					int balance = payDAO.totalPoint(buyer);
					
					if(balance > point) {
						
						buyer.setBno(bno);
						buyer.setPoint(-point);
						buyer.setProductDesc(boardVO.getSubtitle() + " 구매");
						payDAO.usePoint(buyer);
						
						seller.setUid(author);
						seller.setBno(bno);
						seller.setPoint(point);
						seller.setProductDesc(boardVO.getSubtitle() + " 판매");
						payDAO.usePoint(seller);
						
					}else {
						boardVO = null;
						BoardVO vo = new BoardVO();
						vo.setBno(-1);
						return vo;
					}
				}
			}
			dao.updateViewCnt(bno);
		}
		int result = dao.checkUserRead(bno, uid);
		logger.info("result = " + result);
		
		if(result == 0) {
			logger.info("result = 0");
			dao.insertUserRead(bno, uid);
		}else {
			logger.info("result != 0");
		}
		return dao.read(bno);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) throws Exception{
//		dao.updateViewCnt(bno);
		
		BoardVO boardVO = new BoardVO();
		boardVO = dao.checkContent(bno);
		int point = boardVO.getPoint();
		if(point>0) {
			logger.info("point > 0");
			boardVO = null;
			BoardVO vo = new BoardVO();
			vo.setBno(-1);
			return vo;
		}
		
		return dao.read(bno);
	}
	
	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception{
		dao.update(board);
		Integer bno = board.getBno();
		
		String[] files = board.getFiles();
		String[] tags = board.getTags();
		
		if(files !=null) {
			dao.deleteAttach(bno);
			for(String fileName : files) {
				dao.replaceAttach(fileName, bno);
			}
		}
		
		dao.deleteTags(bno);
		if(tags != null) {
			for(String tag : tags) {
				dao.addTags(bno, tag);
			}
		}
	}
	
	@Transactional
	@Override
	public void remove(Integer bno) throws Exception{
		dao.deleteAttach(bno);
		dao.deleteReplyAll(bno);
		dao.delete(bno);
		dao.deleteTags(bno);
	}
	
//	@Override
//	public List<BoardVO> listAll() throws Exception{
//		return dao.listAll();
//	}
//	
//	@Override
//	public List<BoardVO> listCriteria(Criteria cri) throws Exception{
//		return dao.listCriteria(cri);
//	}
//	
//	@Override
//	public int listCountCriteria(Criteria cri) throws Exception {
//		return dao.countPaging(cri);
//	}
	
	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return dao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception{
		return dao.getAttach(bno);
	}
	
	@Override
	public List<BoardVO> listSubtitlePage(Integer tno, Criteria cri, String uid) throws Exception {
		return dao.listPage(tno, cri, uid);
	}
	
	@Override
	public List<BoardVO> mylistSubtitlePage(Integer tno, Criteria cri) throws Exception {
		return dao.mylistPage(tno, cri);
	}
	
	@Override
	public int count(Integer tno) throws Exception {
		return dao.count(tno);
	}
	
	@Override
	public int mycount(Integer tno) throws Exception {
		return dao.mycount(tno);
	}
	
	@Transactional
	@Override
	public void readComplete(BoardVO vo) throws Exception{
		dao.readComplete(vo);
	}
	
	@Transactional
	@Override
	public BoardVO checkContent(Integer bno) throws Exception{
		
		BoardVO boardVO = new BoardVO();
		boardVO = dao.checkContent(bno);
		
		return boardVO;
	}
	
}
