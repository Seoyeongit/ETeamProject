package com.forpets.view.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forpets.biz.service.Service;
import com.forpets.biz.service.ServiceVO;
import com.forpets.biz.serviceImpl.ServiceDAO;

@Controller
public class ServiceController {
	
	@Autowired
	private Service serv;
	
	@RequestMapping(value="getService")
	@ResponseBody
	public void getService(ServiceVO vo, ServiceDAO petDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> getService 실행");
		session.setAttribute("serv", serv.getServ(vo, Integer.parseInt(request.getParameter("s_num"))));
		System.out.println("---> getService 완료");
	}
}
