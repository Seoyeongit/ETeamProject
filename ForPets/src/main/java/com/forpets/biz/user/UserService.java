package com.forpets.biz.user;

public interface UserService {
	//유저정보불러오기
	UserVO getUser(UserVO vo);
	
	//유저정보 수정하기
	void updateUser(UserVO vo);
	
	
	//유저 회원 저장
	void saveUser(UserVO vo);
	
	//비밀번호변경
	void changePw(UserVO vo);
	
	//회원삭제
	void deleteUser(UserVO vo);
	
	//아이디중복체크
	UserVO getUserById(UserVO vo);
	
	//핸드폰인증번호체크
	void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
}
