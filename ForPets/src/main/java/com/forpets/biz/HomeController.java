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

import com.forpets.biz.community.CommunityService;
import com.forpets.biz.reserve.ReserveService;
import com.forpets.biz.review.ReviewService;
import com.forpets.biz.survey.SurveyDetailService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	CommunityService comservice;
	
	@Autowired
	SurveyDetailService svservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/")
	public String home(HttpServletRequest request, Model model) throws Exception {
		request.getSession(false);

		model.addAttribute("reviewList", reviewService.getReviewListAll());
		
		model.addAttribute("communityList", comservice.getCommunityList());
		model.addAttribute("svcode", svservice.getSurveyList());	
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