package com.forpets.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.user.UserService;
import com.forpets.biz.user.UserVO;


@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}
	
	@Override
	public void changePw(UserVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void deleteUser(UserVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	
	@Override
	public void saveUser(UserVO vo) {
		userDAO.saveUser(vo);
	}
	
	//회원검색(ID)
	@Override
	public UserVO getUserById(UserVO vo) {
		return userDAO.getUserById(vo);
	}
	
	
	

}
