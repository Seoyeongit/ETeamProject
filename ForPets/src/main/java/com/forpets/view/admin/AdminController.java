package com.forpets.view.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Admin")
public class AdminController {

	@RequestMapping(value="/adminInfo")
	public String adminInfo() throws Exception {
//		System.out.println("---> adminInfo 이동");
		return "/Admin/adminInfo";
	}
	
	@RequestMapping(value="/mgmtBoard")
	public String mgmtBoard() throws Exception {
//		System.out.println("---> mgmtBoard 이동");
		return "/Admin/mgmtBoard";
	}
	
	@RequestMapping(value="/mgmtPartner")
	public String mgmtPartner() throws Exception {
//		System.out.println("---> mgmtPartner 이동");
		return "/Admin/mgmtPartner";
	}
	
	@RequestMapping(value="/mgmtUser")
	public String mgmtUser() throws Exception {
//		System.out.println("---> mgmtUser 이동");
		return "/Admin/mgmtUser";
	}
	
}
