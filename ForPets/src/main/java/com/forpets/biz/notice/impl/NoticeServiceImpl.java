package com.forpets.biz.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.notice.NoticeService;
import com.forpets.biz.notice.NoticeVO;
import com.forpets.biz.notice.SearchCriteria;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}

	@Override
	public NoticeVO getNoticeBoard(NoticeVO vo, int ntc_seq) {
		return noticeDAO.getNoticeBoard(vo, ntc_seq);
	}

	@Override
	public void insertNotice(NoticeVO vo) {
		noticeDAO.insertNotice(vo);
	}
	
	@Override
	public void updateNotice(NoticeVO vo) {
		noticeDAO.updateNotice(vo);
	}
	
	@Override
	public void deleteNotice(NoticeVO vo) {
		noticeDAO.deleteNotice(vo);
	}

	@Override
	public List<NoticeVO> getNoticeWithPaging(SearchCriteria cri) {
		return noticeDAO.getNoticeWithPaging(cri);
	}

	@Override
	public List<NoticeVO> getNoticeWithDynamicPaging(SearchCriteria cri) {
		return noticeDAO.getNoticeWithDynamicPaging(cri);
	}

	@Override
	public int getTotalPages(SearchCriteria cri) {
		return noticeDAO.getTotalPages(cri);
	}
}
