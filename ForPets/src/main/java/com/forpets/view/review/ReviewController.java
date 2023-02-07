package com.forpets.view.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	
	@RequestMapping(value = "/myInfo/review", method = RequestMethod.GET)
	public String review() {
		return "myInfo/myReview";
	}
}
