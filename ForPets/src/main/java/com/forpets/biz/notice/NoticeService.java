package com.forpets.biz.notice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.notice.SearchCriteria;

/*
 *  공지사항관련 서비스는 여기서 추상메서드를 추가하세요.
 */
@Service
public interface NoticeService {

	//공지 작성
	public void insertNotice(NoticeVO vo) throws Exception;
	
	//목록 보기
	public List<NoticeVO> getNoticeList(NoticeVO vo) throws Exception;

	//공지사항 글 보기
	NoticeVO getNoticeBoard(NoticeVO vo, int ntc_seq) throws Exception;

	//수정
	public void updateNotice(NoticeVO vo) throws Exception;

	//삭제
	public void deleteNotice(NoticeVO vo);
	
	
	//paging
	List<NoticeVO> getNoticeWithPaging(SearchCriteria cri);
	
	//paging dynamic
	List<NoticeVO> getNoticeWithDynamicPaging(SearchCriteria cri);

	int getTotalPages(SearchCriteria cri);
	
}
