package com.forpets.biz.tip.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.tip.SearchCriteria;
import com.forpets.biz.tip.TipVO;

@Repository("tipDAO")
public class TipDAO {
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	private final String BOARD_INSERT = "insert into tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit) "
			+ "values((tip_board_seq.NEXTVAL), ?, ?, ?, ?, ?)";
	
	private final String BOARD_UPDATE = "update tip_board set tip_title=?, tip_content=?, tip_img_url=?, tip_video=?, tip_update_date= sysdate " 
			+ "where tip_seq = ?";
	private final String BOARD_UPDATE_HIT = "update tip_board set tip_hit=? " 
			+ "where tip_seq = ?";
	
	private final String BOARD_DELETE = "delete from tip_board where tip_seq = ?";
	
	private final String BOARD_GET = "select * from tip_board where tip_seq = ?";
	public final String BOARD_LIST_T = 
			"select * from tip_board where tip_title like ";
	public final String BOARD_LIST_C = 
			"select * from tip_board where tip_content like ";
	
	// paging 처리
	private final String GETTOTALPAGES = "SELECT COUNT(*) FROM TIP_BOARD WHERE 1 = 1 ";
	private final String GETTIPLISTWITHPAGING =
			"SELECT TIP_SEQ,TIP_TITLE, TIP_CONTENT, TIP_IMG_URL, TIP_VIDEO, TIP_CREATE_DATE, TIP_HIT, TIP_UPDATE_DATE " + 
			"FROM (SELECT ROWNUM RN, TIP_SEQ,TIP_TITLE, TIP_CONTENT, TIP_IMG_URL, TIP_VIDEO, TIP_CREATE_DATE, TIP_HIT, TIP_UPDATE_DATE " +
					"FROM TIP_BOARD " + 
					"WHERE ROWNUM <= ? * ? " + 
					"ORDER BY SEQ DESC" + 
			") " + 
			"WHERE RN > (? - 1) * ?";
			
	// paging 처리 끝
	
	public RowMapper<TipVO> TipRowMapper = (resultSet, rowNum) -> {
		TipVO newTip = new TipVO();
		newTip.setTip_seq(resultSet.getInt("TIP_SEQ"));
		newTip.setTip_title(resultSet.getString("TIP_TITLE"));
		newTip.setTip_content(resultSet.getString("TIP_CONTENT"));
		newTip.setTip_img_url(resultSet.getString("TIP_IMG_URL"));
		newTip.setTip_video(resultSet.getString("TIP_VIDEO"));
		newTip.setTip_create_date(resultSet.getDate("TIP_CREATE_DATE"));
		newTip.setTip_hit(resultSet.getInt("TIP_HIT"));
		newTip.setTip_update_date(resultSet.getDate("TIP_UPDATE_DATE"));
		return newTip;
	};
	
	
	
	public void insertTip(TipVO vo) {
		
		String[] url = vo.getTip_video().split("be/");
		String url_id = url[1];
		vo.setTip_img_url("https://img.youtube.com/vi/"+url_id+"/mqdefault.jpg");
		vo.setTip_video("https://www.youtube.com/embed/"+url_id);
		
		jdbcTemplate.update(BOARD_INSERT, vo.getTip_title(), vo.getTip_content(), vo.getTip_img_url(), vo.getTip_video(), 0);
	}
	
	public void updateTip(TipVO vo) {
		jdbcTemplate.update(BOARD_UPDATE,vo.getTip_title(), vo.getTip_content(), vo.getTip_img_url(), vo.getTip_video(), vo.getTip_seq());
	}
	
	public void updateTip_Hit(TipVO vo) {
		jdbcTemplate.update(BOARD_UPDATE_HIT, vo.getTip_hit()+1, vo.getTip_seq());
	}
	
	public void deleteTip(TipVO vo) {
		jdbcTemplate.update(BOARD_DELETE, vo.getTip_seq());
	}
	
	
	public TipVO getTip(TipVO vo) {
		TipVO tip = jdbcTemplate.queryForObject(BOARD_GET, 
				(resultSet, rowNum) -> {
					TipVO newTip = new TipVO();
					newTip.setTip_seq(resultSet.getInt("TIP_SEQ"));
					newTip.setTip_title(resultSet.getString("TIP_TITLE"));
					newTip.setTip_content(resultSet.getString("TIP_CONTENT"));
					newTip.setTip_img_url(resultSet.getString("TIP_IMG_URL"));
					newTip.setTip_video(resultSet.getString("TIP_VIDEO"));
					newTip.setTip_create_date(resultSet.getDate("TIP_CREATE_DATE"));
					newTip.setTip_hit(resultSet.getInt("TIP_HIT"));
					newTip.setTip_update_date(resultSet.getDate("TIP_UPDATE_DATE"));
					return newTip;
				}
				, vo.getTip_seq());
		updateTip_Hit(tip);
		System.out.println("tip_create_date : " + tip.getTip_create_date());
		System.out.println("tip_update_date : " + tip.getTip_update_date());
		return tip;
	}
	
	/*
	public List<TipVO> getTipList(TipVO vo) {
		System.out.println("getTipList 실행");
		String sql = null;
		if (vo.getSearchCondition().equals("TITLE")) {
			sql = BOARD_LIST_T;
		} else if (vo.getSearchCondition().equals("CONTENT")) {
			sql = BOARD_LIST_C;
		}
		
		return jdbcTemplate.query(sql +"'%" + vo.getSearchKeyword() +"%'" + " order by tip_seq desc", TipRowMapper);
	}
	*/
	
	// paging 처리
	public int getTotalPages(SearchCriteria cri) {
		String sql = GETTOTALPAGES;
		if(cri.getSearchCondition() == "TITLE") {
			sql += "AND TIP_TITLE LIKE '%" + cri.getSearchKeyword()+ "%'";
		}
		if(cri.getSearchCondition() == "CONTENT") {
			sql += "AND TIP_CONTENT LIKE '%" + cri.getSearchKeyword()+ "%'";
		}
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	// 글 목록 조회 with paging
	public List<TipVO> getTipListWithPaging(SearchCriteria cri) {
		Object[] orgs = {cri.getPageNum(), cri.getAmount(), cri.getPageNum(), cri.getAmount()};
		return jdbcTemplate.query("GETTIPLISTWITHPAGING", orgs, TipRowMapper);
	}
	
	// 글 목록 조회 with paging
	public List<TipVO> getTipListWithDynamicPaging(SearchCriteria cri) {
		String sql_in =
			"SELECT ROWNUM RN, TIP_SEQ, TIP_TITLE, TIP_CONTENT, TIP_IMG_URL, TIP_VIDEO, TIP_CREATE_DATE, TIP_HIT, TIP_UPDATE_DATE " +
			"FROM ( SELECT * FROM TIP_BOARD WHERE 1 = 1 ";
		if(cri.getSearchCondition() == "TITLE") {
			sql_in += "AND TIP_TITLE LIKE '%" + cri.getSearchKeyword()+ "%'";
		}
		if(cri.getSearchCondition() == "CONTENT") {
			sql_in += "AND TIP_CONTENT LIKE '%" + cri.getSearchKeyword()+ "%'";
		}
		sql_in += "ORDER BY TIP_SEQ DESC) WHERE ROWNUM <= " + cri.getPageNum() * cri.getAmount();
		
		String sql =
			"SELECT TIP_SEQ,TIP_TITLE, TIP_CONTENT, TIP_IMG_URL, TIP_VIDEO, TIP_CREATE_DATE, TIP_HIT, TIP_UPDATE_DATE " + 
			"FROM (" + sql_in + ") WHERE RN > " + (cri.getPageNum() - 1) * cri.getAmount();
		
		return jdbcTemplate.query(sql, TipRowMapper);
	}
	
	
}
