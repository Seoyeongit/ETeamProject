package com.forpets.view.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@RequestMapping(value="/Service/{pageName}")
	public String getServicePage(@PathVariable("pageName")String pageName) {
		return "Service/" + pageName;
	}
	
	@RequestMapping(value="/FindHospital/{pageName}")
	public String getFindHospitalPage(@PathVariable("pageName")String pageName) {
		return "FindHospital/" + pageName;
	}
	
}
