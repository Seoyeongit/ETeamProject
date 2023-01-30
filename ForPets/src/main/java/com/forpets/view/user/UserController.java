package com.forpets.view.user;

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
	public String updateProfileView(UserVO vo, UserDAO userDAO, Model model) {
		vo.setUser_id("abc123");
		vo.setUser_pw("123");
		model.addAttribute("userInfo", userService.getUser(vo));
		return "myInfo/editProfile";
	}
	
	//회원정보수정처리
	@RequestMapping(value="/myInfo/edit", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("userInfo")UserVO vo, UserDAO userDAO) {
		System.out.println("회원 정보 수정 처리");
		System.out.println(vo.toString());
		userService.updateUser(vo);
		return "forward:/myInfo/edit-Profile";
	}
	
}
