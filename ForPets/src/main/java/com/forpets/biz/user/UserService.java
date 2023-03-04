package com.forpets.biz.user;

import com.forpets.biz.partner.PartnerVO;

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
	
	
	/*유저통계를 구합니다.*/
	
	//유저의가입기간
	int cntUserJoinPeriod(String user_id);
	//유저가 자주신청한 펫트너
	PartnerVO multipleTimesPart(String user_id);
	//유저가 단골펫트너에게 몇번 서비스를 받았는지 구합니다
	int cntMultiPleTime(String user_id);
	//유저가 신청했던 케어서비스 횟수입니다.
	int cntTotalServe(String user_id);
	//자주신청한 케어서비스
	String getMultiPleServ(String user_id);
	//소모임참여횟수
	int cntCommunityPrt(String user_id);
}
