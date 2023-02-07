package com.forpets.view.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forpets.biz.service.Service;
import com.forpets.biz.service.ServiceVO;
import com.forpets.biz.serviceImpl.ServiceDAO;

@Controller
public class ServiceController {
	
	@Autowired
	private Service serv;
	
	@RequestMapping(value="/Service/getService")
	public String getService(ServiceVO vo, ServiceDAO petDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> getService 실행");
		String[] s_numList = request.getParameterValues("s_num");
		System.out.println("s_numList length : " + s_numList.length);
		List<ServiceVO> svoList = new ArrayList<ServiceVO>();
		int total_price = 0;
		for (int i=0;i<s_numList.length;i++) {
			System.out.println(i+"번째 s_numList : " + s_numList[i]);
			ServiceVO svo = serv.getServ(vo, Integer.parseInt(s_numList[i]));
			total_price += svo.getS_price();
			svoList.add(svo);
		}
		session.setAttribute("servList", svoList);
		session.setAttribute("total_price", total_price);
		System.out.println("---> getService 완료");
		return "forward:/Service/reserve";
	}
}
