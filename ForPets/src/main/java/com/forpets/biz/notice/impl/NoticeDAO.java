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
	private final String GET_NOTICE = "select * from community where ntc_seq=?";
	
	private final RowMapper<NoticeVO> noticeRowMapper = (resultSet, rowNum) -> {
		NoticeVO newvo = new NoticeVO();
		newvo.setNtc_seq(resultSet.getInt("ntc_seq"));
		newvo.setNtc_title(resultSet.getString("ntc_title"));
		newvo.setNtc_ctnt(resultSet.getString("ntc_ctnt"));
		newvo.setNtc_cdate(resultSet.getDate("ntc_cdate"));
		newvo.setNtc_hit(resultSet.getInt("ntc_hit"));
		
		return newvo;
	};
	
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("---> JDBC로 getNoticeList() 기능 처리");
		return jdbcTemplate.query(NOTICE_LIST, noticeRowMapper);
	}
	
	// 글 상세 조회
	public NoticeVO getNoticeBoard(NoticeVO vo, int ntc_seq) {
		System.out.println("---> JDBC로 getPartner() 기능 처리");
		NoticeVO ntcvo = jdbcTemplate.queryForObject(GET_NOTICE,
				(resultSet, rowNum) -> {
					NoticeVO newvo = new NoticeVO();
					
					newvo.setNtc_seq(resultSet.getInt("ntc_seq"));
					newvo.setNtc_title(resultSet.getString("ntc_title"));
					newvo.setNtc_ctnt(resultSet.getString("ntc_ctnt"));
					newvo.setNtc_cdate(resultSet.getDate("ntc_cdate"));
					newvo.setNtc_hit(resultSet.getInt("ntc_hit"));
					return newvo;
				}
				, ntc_seq);
		return ntcvo;
	}


}
