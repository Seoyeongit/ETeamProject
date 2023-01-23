package com.forpets.view.serv;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forpets.biz.serv.Serv;
import com.forpets.biz.serv.ServVO;
import com.forpets.biz.serv.impl.ServDAO;

@Controller
public class ServController {
	
	@Autowired
	private Serv service;
	
	@RequestMapping(value="getService.do")
	@ResponseBody
	public void getService(ServVO vo, ServDAO petDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> getService.do 실행");
		session.setAttribute("serv", service.getServ(vo, Integer.parseInt(request.getParameter("s_num"))));
		System.out.println("---> getService.do 완료");
	}
}
