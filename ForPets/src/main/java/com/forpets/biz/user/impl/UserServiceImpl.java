package com.forpets.biz.user.impl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.user.UserService;
import com.forpets.biz.user.UserVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



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
	
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key="NCSXLA7N3JM1TQV3";
		String api_secret ="KXSKGLKCF6JECKHSFJHBTO9A1NJWAIFL";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String>params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); //수신전화번호
		params.put("from", "01028856948");
		params.put("text","[포펫츠]인증번호"+"["+randomNumber+"]"+"를 입력해주세요.");
		params.put("type", "SMS");
		params.put("app_version", "test app 1.2"); // application name and version;
		
		
		try {
			JSONObject obj = (JSONObject)coolsms.send(params);
			System.out.println(obj.toString());
		}catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	

}
