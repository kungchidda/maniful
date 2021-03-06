package com.kungchidda.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kungchidda.domain.PageMaker;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.service.MyPageService;


@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private MyPageService service;
	
	
	
	@RequestMapping(value="/titleList", method = RequestMethod.GET)
	public void userHome(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info(cri.toString());
			
			String uid = cri.getUid();
			logger.info("cri.uid = " + cri.getUid());
			logger.info("uid = " + uid);
			model.addAttribute(service.setting(uid));
			model.addAttribute("homeList", service.listSearchCriteria(uid, cri));
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@RequestMapping(value="/subscribedList", method = RequestMethod.GET)
	public void subscribedList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info(cri.toString());

			//HttpSession session = request.getSession();
			//UserVO vo = (UserVO)session.getAttribute("login");
			String uid = cri.getUid();
			logger.info("cir.uid = " + cri.getUid());
			logger.info("uid = " + uid);
			model.addAttribute(service.setting(uid));
			model.addAttribute("subscribedList", service.listSubscribedSearchCriteria(uid, cri));
//			model.addAttribute("subscriberList", service.listSubscriberSearchCriteria(uid, cri));
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			
	}
	
	
	@RequestMapping(value="/subscriberList", method = RequestMethod.GET)
	public void subscriberList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
			logger.info("/mypage/subscriber/ GET start");
			logger.info(cri.toString());

//			HttpSession session = request.getSession();
//			UserVO vo = (UserVO)session.getAttribute("login");
//			String uid = vo.getUid();
//			logger.info("vo.uid = " + vo.getUid());
//			logger.info("uid = " + uid);
			String uid = cri.getUid();
			logger.info("cir.uid = " + cri.getUid());
			logger.info("uid = " + uid);
			model.addAttribute(service.setting(uid));
			model.addAttribute("list", service.listSubscriberSearchCriteria(uid, cri));
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			
	}
	
	
	@RequestMapping(value="/setting", method = RequestMethod.GET)
	public void setting(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
			
		
//			HttpSession session = request.getSession();
//			UserVO vo = (UserVO)session.getAttribute("login");
//			String uid = vo.getUid();
//			logger.info("vo.uid = " + vo.getUid());
//			logger.info("uid = " + uid);
			String uid = cri.getUid();
			logger.info("cir.uid = " + cri.getUid());
			logger.info("uid = " + uid);
			
			model.addAttribute(service.setting(uid));
			
			
	}
}
