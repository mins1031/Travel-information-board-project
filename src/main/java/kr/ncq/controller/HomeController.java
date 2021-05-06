package kr.ncq.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletResponse response) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		Cookie cookie = new Cookie("view",null);
		cookie.setComment("게시글 조회 확인");
		cookie.setMaxAge(60*60*24*365);
		response.addCookie(cookie);
		log.info(cookie.getComment());
		log.info(cookie.getName());
		log.info(cookie.getValue());
		
		
		return "index";
	}
	
	/*@RequestMapping(value = "/product/index", method = RequestMethod.GET)
	public String index() {
		log.info("Hi");
		
		return "/product/index";
	}
	*/
	
	@RequestMapping(value="home", method=RequestMethod.GET)
	public void testHome() {
		log.info("home");
	}
}
