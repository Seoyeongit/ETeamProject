package com.forpets.biz.notice;

import java.util.List;

import com.forpets.biz.community.CommunityVO;

/*
 *  공지사항관련 서비스는 여기서 추상메서드를 추가하세요.
 */
public interface NoticeService {

	
	public List<NoticeVO> getNoticeList(NoticeVO vo) throws Exception;
	
}
