package com.forpets.biz;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
	

	@RequestMapping(value = "/")
	public String home(HttpServletRequest request) {
		request.getSession(false);
		return "home";
	}
	
	@RequestMapping(value ="/rofstep")
	public String AdminLogin(HttpServletRequest request) {
		request.getSession(false);
		return "adminLogin";
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(HttpServletRequest request) {
//		request.getSession(false);
//		return "home";
//	}
	
}