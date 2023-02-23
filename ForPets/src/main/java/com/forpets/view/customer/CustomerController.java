package com.forpets.view.customer;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.forpets.biz.customer.CustomerService;
import com.forpets.biz.customer.CustomerVO;
import com.forpets.biz.customer.impl.CustomerDAO;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.user.UserVO;

@Controller	// 컨트롤러 bean으로 등록
//@SessionAttributes("customer")

public class CustomerController {
	
	@Autowired
	CustomerService custservice;
	
	@RequestMapping(value="/customer.do")
	public String customer(CustomerVO vo, CustomerDAO dao, Model model) throws IOException {

		return "/customer/customer";
	}
	
	// http://localhost/forpets
	@RequestMapping(value="/getCustomerList")	//url 과 method 매핑
	public String getCustomerList(CustomerVO vo,CustomerDAO dao, Model model) throws IOException {
		
		System.out.println("---> getCustomerList 실행");
		System.out.println("SearchCondition : " + vo.getSearchCondition());
		System.out.println("SearchKeyword : " + vo.getSearchKeyword());
		if (vo.getSearchCondition() == null) { vo.setSearchCondition("TITLE"); }
		if (vo.getSearchKeyword() == null) { vo.setSearchKeyword(""); }
		System.out.println("SearchCondition : " + vo.getSearchCondition());
		System.out.println("SearchKeyword : " + vo.getSearchKeyword());
	
		model.addAttribute("CustList", custservice.getCustomerList(vo));
		System.out.println("--->getCustomerList완료");
		return  "/customer/getCustomerList";
	
	}
	
	
	@RequestMapping(value="/insertCustomer.do")
	public String insertCustomer(CustomerVO vo, CustomerDAO dao, HttpServletRequest request, HttpSession session) throws IOException {
		vo.setCust_title(request.getParameter("title"));
		vo.setCust_content(request.getParameter("content"));
		if(session.getAttribute("member") != null) {
			UserVO uvo = (UserVO) session.getAttribute("member");
			vo.setUser_id(uvo.getUser_id());
		}
		if(session.getAttribute("partners") != null) {
			PartnerVO pvo = (PartnerVO) session.getAttribute("partners");
			vo.setPart_id(pvo.getPart_id());
		}
		custservice.insertCustomer(vo);
		
		return "forward:/getCustomerList";
	}
	
	@RequestMapping(value="/deleteCustomer")
	public String deleteCustomer(CustomerVO vo,CustomerDAO dao)throws IOException {
		
		custservice.deleteCustomer(vo);
		return "forward:/getCustomerList";
	}
	
	@RequestMapping(value="/updateCustomer")
	public String updateCustomer(CustomerVO vo,CustomerDAO dao, HttpServletRequest request)throws IOException {
		vo.setCust_title(request.getParameter("title"));
		vo.setCust_content(request.getParameter("content"));
		custservice.updateCustomer(vo);
		return "forward:/getCustomerList";
	}
	
	@RequestMapping(value="/getCustomerBoard")
	public String getCustomerBoard(CustomerVO vo, CustomerDAO dao, Model model) throws IOException {
		model.addAttribute("customer", custservice.getCustomerBoard(vo));
		return "/customer/getCustomerBoard";
	}
	
	@RequestMapping(value="/myCustBoard")
	public String myCustBoard(CustomerVO vo, CustomerDAO dao, Model model, HttpSession session) throws IOException {
		if(session.getAttribute("partners") != null) {
			PartnerVO pvo = (PartnerVO) session.getAttribute("partners");
			vo.setPart_id(pvo.getPart_id());
		}else {
			UserVO uvo = (UserVO) session.getAttribute("member");
			vo.setUser_id(uvo.getUser_id());
		}
		model.addAttribute("myCustBoard", custservice.myCustBoard(vo));
		return "/customer/myCustBoard";
	}
	
	@RequestMapping(value="/customerBoard")
	public String customerBoard(CustomerVO vo, CustomerDAO dao) throws IOException {
		return "customer/insertCustomer";
	}
	

}
