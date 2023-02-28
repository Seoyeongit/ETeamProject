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

import com.forpets.biz.customer.CustomerPagingDTO;
import com.forpets.biz.customer.CustomerReVO;
import com.forpets.biz.customer.CustomerService;
import com.forpets.biz.customer.CustomerVO;
import com.forpets.biz.customer.SearchCriteria;
import com.forpets.biz.customer.impl.CustomerDAO;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.user.UserVO;

@Controller	// 컨트롤러 bean으로 등록
//@SessionAttributes("customer")

public class CustomerController {
	
	@Autowired
	CustomerService custservice;
	
	@RequestMapping(value="/customerMain")
	public String customer(CustomerVO vo, CustomerDAO dao) throws IOException {
		
		
		return "/customer/customer";
	}
	
	@RequestMapping(value="/customer.do")
	public String customer2(CustomerVO vo, CustomerDAO dao, Model model) throws IOException {

		return "/customer/customer2";
	}
	
//	// http://localhost/forpets
//	@RequestMapping(value="/getCustomerList")	//url 과 method 매핑
//	public String getCustomerList(CustomerVO vo,CustomerDAO dao, Model model) throws IOException {
//		
//		System.out.println("---> getCustomerList 실행");
//		System.out.println("SearchCondition : " + vo.getSearchCondition());
//		System.out.println("SearchKeyword : " + vo.getSearchKeyword());
//		if (vo.getSearchCondition() == null) { vo.setSearchCondition("TITLE"); }
//		if (vo.getSearchKeyword() == null) { vo.setSearchKeyword(""); }
//		System.out.println("SearchCondition : " + vo.getSearchCondition());
//		System.out.println("SearchKeyword : " + vo.getSearchKeyword());
//	
//		model.addAttribute("CustList", custservice.getCustomerList(vo));
//		System.out.println("--->getCustomerList완료");
//		return  "/customer/getCustomerList";
//	
//	}
	
	@RequestMapping(value="/searchMain")
public String searchCustomerList(CustomerVO vo,CustomerDAO dao, Model model) throws IOException {
		
		System.out.println("---> searchCustomerList 실행");
		System.out.println("SearchKeyword : " + vo.getSearchKeyword());
		if (vo.getSearchKeyword() == null) { vo.setSearchKeyword(""); }
		System.out.println("SearchKeyword : " + vo.getSearchKeyword());
	
		model.addAttribute("CustList", custservice.searchCustomerList(vo));
		System.out.println("--->searchCustomerList완료");
		
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
		
		return "forward:/myCustBoard";
	}
	
	@RequestMapping(value="/deleteCustomer")
	public String deleteCustomer(CustomerVO vo,CustomerDAO dao)throws IOException {
		
		custservice.deleteCustomer(vo);
		return "forward:/myCustBoard";
	}
	
	@RequestMapping(value="/updateCustomer")
	public String updateCustomer(CustomerVO vo,CustomerDAO dao, HttpServletRequest request)throws IOException {
		vo.setCust_title(request.getParameter("title"));
		vo.setCust_content(request.getParameter("content"));
		vo.setCust_no(Integer.parseInt(request.getParameter("cust_no")));
		System.out.println("제목"+ vo.getCust_title() + "내용" + vo.getCust_content());
		System.out.println("Cust_no : " + vo.getCust_no());
		custservice.updateCustomer(vo);
		return "forward:/getCustomerBoardView";
	}
	
	@RequestMapping(value="/getCustomerBoardView")
	public String getCustomerBoardView(CustomerVO vo, CustomerDAO dao, CustomerReVO rvo, HttpSession session) throws IOException {
		session.getAttribute("cust_no");
		session.setAttribute("customer", custservice.getCustomerBoardView(vo));
		rvo.setCust_no(vo.getCust_no());
		try {
			CustomerReVO cvo = custservice.getCustomerRe(rvo);
			session.setAttribute("customerRe", cvo);
		} catch(Exception e) {
			
		}
		return "/customer/getCustomerBoardView";
	}
	
	@RequestMapping(value="/getCustomerBoard")
	public String getCustomerBoard(CustomerVO vo, CustomerDAO dao, HttpSession session, HttpServletRequest request) throws IOException {
		session.getAttribute("cust_no");
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
		session.setAttribute("myCustBoard", custservice.myCustBoard(vo));
		return "/customer/myCustBoard";
	}
	
	@RequestMapping(value="/customerBoard.do")
	public String customerBoard(CustomerVO vo, CustomerDAO dao, HttpSession session) throws IOException {
		if(session.getAttribute("member") != null) {
			UserVO uvo = (UserVO) session.getAttribute("member");
			vo.setUser_id(uvo.getUser_id());
			session.setAttribute("customer", vo);
		}
		if(session.getAttribute("partners") != null) {
			PartnerVO pvo = (PartnerVO) session.getAttribute("partners");
			vo.setPart_id(pvo.getPart_id());
			session.setAttribute("customer", vo);
		}
		return "customer/insertCustomer";
	}
	
	@RequestMapping(value="insertCustomerRe")
	public String insertCustomerRe(CustomerReVO vo, CustomerDAO dao, HttpServletRequest request, HttpSession session) throws IOException {
		vo.setCust_no(Integer.parseInt(request.getParameter("cust_no")));
		vo.setCust_content(request.getParameter("content"));
		System.out.println(vo.getCust_no());
		System.out.println(vo.getCust_content());
		try {
			CustomerReVO cvo = custservice.getCustomerRe(vo);
		} catch(Exception e) {
			custservice.insertCustomerRe(vo);
			return "customer/getCustomerBoardView";
		}
		
		custservice.updateCustomerRe(vo);
		
		session = request.getSession(false);
		
		//1.session이 있고 + 2.session정보가 있으면 
		if(session != null && session.getAttribute("customerRe") != null) { 
			CustomerReVO cvo = custservice.getCustomerRe(vo);
			session.setAttribute("customerRe", cvo);
		}
		
		return "customer/getCustomerBoardView";
	}
	
	@RequestMapping(value="/getCustomerList")
	   public String getTipList(CustomerVO vo, CustomerDAO DAO, SearchCriteria cri, Model model) {
	      System.out.println("---> getCustomerList 실행");
	      System.out.println("SearchCondition : " + cri.getSearchCondition());
	      System.out.println("SearchKeyword : " + cri.getSearchKeyword());
	      if (cri.getSearchCondition() == null) { cri.setSearchCondition("TITLE"); }
	      if (cri.getSearchKeyword() == null) { cri.setSearchKeyword(""); }
	      System.out.println("SearchCondition : " + cri.getSearchCondition());
	      System.out.println("SearchKeyword : " + cri.getSearchKeyword());
	      
	      System.out.println("totalpages : " + custservice.getTotalPages(cri));
	      
	      CustomerPagingDTO pageMaker = new CustomerPagingDTO(cri, custservice.getTotalPages(cri));
	      
	      model.addAttribute("pageMaker", pageMaker);
	      model.addAttribute("CustList", custservice.getCustomerListWithDynamicPaging(cri));
	      System.out.println("---> getCustomerList 완료");
	      return  "/customer/getCustomerList";
	   }
}
