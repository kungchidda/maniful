package com.kungchidda.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.kungchidda.domain.UserVO;
import com.kungchidda.dto.LoginDTO;
import com.kungchidda.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	private UserService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		
		UserVO vo = service.login(dto);
		
		if(vo == null) {
			return;
		}
		
		model.addAttribute("userVO", vo);
		
		//loginCookie 값이 유지되는 시간 정보를 데이터 베이스에 저장
		if(dto.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7;
			
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			
			service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
		}
		
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Object obj = session.getAttribute("login");
		
		if(obj != null) {
			UserVO vo = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUid(), session.getId(), new Date());
			}
			
		}
		return "redirect:/sboard/list";
	}

}
