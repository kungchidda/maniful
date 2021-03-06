package com.kungchidda.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");

		if(userVO != null) {
			
			logger.info("new login success");
			session.setAttribute(LOGIN, userVO);
			
			if(request.getParameter("useCookie") != null) {
				
				logger.info("remember me....................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7); //브라우저에 1주일간 저장
				response.addCookie(loginCookie);
				
			}

			//response.sendRedirect("/");
			Object dest = session.getAttribute("dest");
			Object referer = session.getAttribute("referer");
			logger.info("referer = " + referer);
			logger.info("dest = " + dest);
			if(dest == null) {
//				if(referer.equals("http://127.0.0.1:8080/user/wronglogin") || referer.equals("http://127.0.0.1:8080/user/login")) {
				if(referer.equals("http://lipman.app/user/wronglogin") || referer.equals("http://lipman.app/user/login") || referer.equals("https://lipman.app/user/wronglogin") || referer.equals("https://lipman.app/user/login")) {
					response.sendRedirect("/");
				}else {
					response.sendRedirect(referer != null ? (String)referer:"/");
				}
			}else {
				response.sendRedirect(dest != null ? (String)dest:"/");
			}
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}

}
