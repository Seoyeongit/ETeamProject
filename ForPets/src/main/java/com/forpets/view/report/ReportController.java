package com.forpets.view.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Report")
public class ReportController {

	@RequestMapping(value="/reportList")
	public String reportList() throws Exception {
//		System.out.println("---> reportList 이동");
		return "/Report/reportList";
	}
	
}
