package com.forpets.biz;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.forpets.biz.reserve.ReserveService;
import com.forpets.biz.review.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ReviewService reviewService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/")
	public String home(HttpServletRequest request, Model model) {
		request.getSession(false);

		model.addAttribute("reviewList", reviewService.getReviewListAll());
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