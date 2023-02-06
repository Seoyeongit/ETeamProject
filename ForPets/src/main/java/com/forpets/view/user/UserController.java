package com.forpets.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String updateProfile(@ModelAttribute("member")UserVO vo, UserDAO userDAO) {
		System.out.println("회원 정보 수정 처리");
		System.out.println("member : " + vo.toString());
		userService.updateUser(vo);
		return "redirect:/myInfo/main";
	}
	
	//임시 >> 로그인.jsp View
	@RequestMapping(value="/member/login",method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	//임시>> 로그인처리
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(UserVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(userService.getUser(vo) != null) {
			session.setAttribute("member", userService.getUser(vo));
			System.out.println(session.getAttribute("member").toString());
			return "redirect:/";
		}else {
			return "member/login";
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
	
}
