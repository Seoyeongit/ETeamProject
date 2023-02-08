package com.forpets.biz.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.notice.NoticeVO;

@Repository("noticeDAO")
public class NoticeDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String NOTICE_LIST = "select * from NOTICE_BOARD order by ntc_seq DESC";
	private final String GET_NOTICE = "select * from NOTICE_BOARD where ntc_seq=?";
	private final String INSERT_NOTICE = "insert into NOTICE_BOARD(ntc_seq, ntc_title, ntc_ctnt, ntc_imgurl, ntc_hit) "
			+ "VALUES((ntc_seq.NEXTVAL), ?, ?, ?, ?)";
	private final String UPDATE_NOTICE = "update NOTICE_BOARD set ntc_title=?, ntc_ctnt=?, ntc_imgurl=?" 
			+ "where ntc_seq=?";
	private final String HIT_NOTICE = "update NOTICE_BOARD set ntc_hit=?"
			+ "where ntc_seq=?";
	private final String DELETE_NOTICE = "delete from NOTICE_BOARD where ntc_seq=?";
	
	private final RowMapper<NoticeVO> noticeRowMapper = (resultSet, rowNum) -> {
		NoticeVO newvo = new NoticeVO();
		newvo.setNtc_seq(resultSet.getInt("ntc_seq"));
		newvo.setNtc_title(resultSet.getString("ntc_title"));
		newvo.setNtc_ctnt(resultSet.getString("ntc_ctnt"));
		newvo.setNtc_imgurl(resultSet.getString("ntc_imgurl"));
		newvo.setNtc_cdate(resultSet.getDate("ntc_cdate"));
		newvo.setNtc_hit(resultSet.getInt("ntc_hit"));
		newvo.setNtc_udate(resultSet.getDate("ntc_udate"));
		
		return newvo;
	};
	
	// 글 list
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
//		System.out.println("---> getNoticeList()");
		return jdbcTemplate.query(NOTICE_LIST, noticeRowMapper);
	}
	
	// 조회수
	public void noticeHit(NoticeVO vo) {
		jdbcTemplate.update(HIT_NOTICE, vo.getNtc_hit()+1, vo.getNtc_seq());
	}
	
	
	// 글 상세 조회
	public NoticeVO getNoticeBoard(NoticeVO vo, int ntc_seq) {
//		System.out.println("---> getNoticeBoard()");
		NoticeVO ntcvo = jdbcTemplate.queryForObject(GET_NOTICE,
				(resultSet, rowNum) -> {
					NoticeVO newvo = new NoticeVO();
					
					newvo.setNtc_seq(resultSet.getInt("ntc_seq"));
					newvo.setNtc_title(resultSet.getString("ntc_title"));
					newvo.setNtc_ctnt(resultSet.getString("ntc_ctnt"));
					newvo.setNtc_imgurl(resultSet.getString("ntc_imgurl"));
					newvo.setNtc_cdate(resultSet.getDate("ntc_cdate"));
					newvo.setNtc_hit(resultSet.getInt("ntc_hit"));
					newvo.setNtc_udate(resultSet.getDate("ntc_udate"));
					return newvo;
				}
				, ntc_seq);
			noticeHit(ntcvo);
		return ntcvo;
	}

	// 글쓰기
	public void insertNotice(NoticeVO vo) {
		jdbcTemplate.update(INSERT_NOTICE, vo.getNtc_title(), vo.getNtc_ctnt(), vo.getNtc_imgurl(), 0);
		System.out.println("---> insertNotice()");
	}


	// 글 수정
	public void updateNotice(NoticeVO vo) {
		jdbcTemplate.update(UPDATE_NOTICE, vo.getNtc_title(), vo.getNtc_ctnt(), vo.getNtc_imgurl(), vo.getNtc_seq());
		System.out.println("---> updateNotice()");
//		System.out.println(vo.getNtc_title() + vo.getNtc_ctnt() + vo.getNtc_imgurl() + vo.getNtc_seq());
	}
	
	// 글 삭제
	public void deleteNotice(NoticeVO vo) {
		jdbcTemplate.update(DELETE_NOTICE, vo.getNtc_seq());
		System.out.println("---> deleteNotice()");
	}
}
