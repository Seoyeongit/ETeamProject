package com.forpets.biz.user;

public interface UserService {
	//유저정보불러오기
	UserVO getUser(UserVO vo);
	
	//유저정보 수정하기
	void updateUser(UserVO vo);
}
