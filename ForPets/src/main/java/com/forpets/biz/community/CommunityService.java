package com.forpets.biz.community;
/*
 *  소모임게시판관련 서비스는 여기서 추상메서드를 추가하세요.
 */

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface CommunityService {
	
	public List<CommunityVO> getCommunityList() throws Exception;
}
