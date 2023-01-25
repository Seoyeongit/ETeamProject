package com.forpets.biz.community;
/*
 *  소모임게시판관련 서비스는 여기서 추상메서드를 추가하세요.
 */

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface CommunityService {
	
	// 게시판 작성
	public void insertCommunity(CommunityVO vo);
	
	// 게시판 보기
	public CommunityVO getCommunityBoard(String c_code);
	
	// 게시판 목록 보기
	public List<CommunityVO> getCommunityList() throws Exception;
	
	// 게시판 글 삭제
	void deleteCommunity(String c_code);
	
	// 게시판 글 수정
	void updateComunity(CommunityVO vo);
	
	// 소모임코드 총 갯수
	public String getlistcount();
	
}
