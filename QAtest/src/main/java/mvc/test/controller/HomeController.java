package mvc.test.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("홈페이지 연결 실행", locale);
		
		
		return "Main/index";
	}
	
	@RequestMapping(value = "/Main/Map", method = RequestMethod.GET)
	public String map() {
		logger.info("지도보기로 이동");
		
		return "Main/Map";
	}
	
	@RequestMapping(value = "/Member/Signcheck", method = RequestMethod.GET)
	public String signcheck() {
		logger.info("회원 가입 약관 체크창으로 이동");
		
		return "Member/Signcheck";
	}
	
	@RequestMapping(value= "/Member/login", method = RequestMethod.GET)
	public String login() {
		logger.info("로그인창으로 이동");
		
		return "Member/login";
	}
	
	@RequestMapping(value="/Member/FindID", method = RequestMethod.GET)
	public String findid() {
		logger.info("아이디 찾기로 이동");
		
		return "Member/FindID";
	}
	
	@RequestMapping(value="/Member/FindPassword", method = RequestMethod.GET)
	public String findpw() {
		logger.info("비밀번호 찾기로 이동");
		
		return "Member/FindPassword";
	}
	
	/*
	 * @RequestMapping(value="/Shop/Shop", method = RequestMethod.GET) public String
	 * shop() { logger.info("상품 리스트 이동");
	 * 
	 * return "Shop/Shop"; }
	 */
}
