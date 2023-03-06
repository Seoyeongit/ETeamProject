package com.forpets.view.user;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forpets.biz.user.UserService;
import com.forpets.biz.user.UserVO;
import com.forpets.biz.user.impl.UserDAO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	

	
	//회원정보수정.jsp를 View.
	@RequestMapping(value="/myInfo/edit-Profile")
	public String updateProfileView() {
		return "myInfo/editProfile";
	}
	
	//회원정보수정처리
	@RequestMapping(value="/myInfo/edit")
	public String updateProfile(@ModelAttribute("member")UserVO vo, UserDAO userDAO,HttpServletRequest request, String birthStr) {
		System.out.println("회원 정보 수정 처리");
		System.out.println("member : " + vo.toString());
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			vo.setBirth(format.parse(birthStr));
		} catch (ParseException e) {
			return "error";
		}
		
		//새로운 세션생성을 방지한다.
		HttpSession session = request.getSession(false);
		
		//1.session이 있고 + 2.session정보가 있으면 
		if(session != null && session.getAttribute("member") != null) { 
		//updateform에있는 정보를 받아와 수정한다.
			userService.updateUser(vo);
			session.setAttribute("member", userService.getUser(vo));
			return "redirect:/myInfo/main";
		}
		
		return  "/";
		
	}
	

	//임시 >> 로그인.jsp View
	@RequestMapping(value="/member/loginMain",method = RequestMethod.GET)
	public String loginChoice() {
		return "member/loginMain";
	}
	
	@RequestMapping(value="/member/login",method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	//로그인처리
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public @ResponseBody Object login(@RequestBody UserVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
		if(userService.getUser(vo) != null) {
			session.setAttribute("member", userService.getUser(vo));
			System.out.println(session.getAttribute("member").toString());
			return 1;
		}else {
			return 0;
		}
		}catch(EmptyResultDataAccessException e) {
			return 0;
		}
		
	}
	
	//임시>> 로그아웃처리
	@RequestMapping(value = "/member/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		
		return "redirect:/";
	}
	
	//회원가입페이지를 VIEW합니다.
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String viewSignUp() {
		return "member/join";
	}
	
	//회원가입
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String join(UserVO vo) {
		userService.saveUser(vo);
		return "member/loginMain";
	}
	
	//아이디 중복 체크
	@RequestMapping(value="/member/checkId", method=RequestMethod.POST)
	public @ResponseBody Object checkId(@RequestBody UserVO vo) {
		UserVO existUser;
		
		try {
			existUser = userService.getUserById(vo);
			if(existUser == null) {
				return 0;
			}else {
				return 1;
			}
		}catch(EmptyResultDataAccessException e) {
			return 0;
		}catch (Exception e) {
			return 9;
		}
	}
	
	@RequestMapping(value="/member/phoneCheck", method=RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone")String userPhoneNumber) {
		int randomNumber = (int)((Math.random()*(9999-1000+1))+1000);
		userService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
		return Integer.toString(randomNumber);
	}
	
	//회원탈퇴 페이지로 넘어갑니다.
	@RequestMapping(value="/member/custInfoOut")
	public String viewInfoOut() {
		return "myInfo/deleteMyInfo";
	}
	
}
