package com.forpets.biz.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.notice.NoticeVO;

@Repository("noticeDAO")
public class NoticeDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String NOTICE_LIST = "select * from NOTICE_BOARD order by ntc_seq DESC";
	
	private final RowMapper<NoticeVO> noticeRowMapper = (resultSet, rowNum) -> {
		NoticeVO vo = new NoticeVO();
		vo.setNtc_seq(resultSet.getInt("ntc_seq"));
		vo.setNtc_title(resultSet.getString("ntc_title"));
		vo.setNtc_ctnt(resultSet.getString("ntc_ctnt"));
		vo.setNtc_cdate(resultSet.getDate("ntc_cdate"));
		vo.setNtc_hit(resultSet.getInt("ntc_hit"));
		
		return vo;
	};
	
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("---> JDBC로 getNoticeList() 기능 처리");
		return jdbcTemplate.query(NOTICE_LIST, noticeRowMapper);
	}
	
//	public NoticeVO getNotice(NoticeVO vo, String part_id) {
//		System.out.println("---> JDBC로 getPartner() 기능 처리");
//		NoticeVO partner = jdbcTemplate.queryForObject(PARTNER_GET,
//				(resultSet, rowNum) -> {
//					NoticeVO newNotice = new NoticeVO();
//					
//					newNotice.set(resultSet.getString("PART_ID"));
//					newNotice.setPart_name(resultSet.getString("PART_NAME"));
//					newNotice.setPart_nick(resultSet.getString("PART_NICK"));
//					newNotice.setPart_add(resultSet.getString("PART_ADD"));
//					newNotice.setGender(resultSet.getString("GENDER").charAt(0));
//					newNotice.setPart_phnumber(resultSet.getString("PART_PHNUMBER"));
//					newNotice.setBirth(resultSet.getDate("BIRTH"));
//					newNotice.setWar(resultSet.getInt("WAR"));
//					newNotice.setPart_no(resultSet.getInt("PART_NO"));
//					newNotice.setData_create(resultSet.getDate("DATA_CREATE"));
//					newNotice.setSelf_infor(resultSet.getString("SELF_INFOR"));
//					return newPartner;
//				}
//				, part_id);
//		return partner;
//	}

}
