package com.forpets.view.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	
	@RequestMapping(value = "/myInfo/writeReview")
	public String writeReviewView() {
		return "myInfo/myReview_2";
	}

}
