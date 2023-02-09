package com.forpets.biz.tip.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.tip.TipVO;

@Repository("tipDAO")
public class TipDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String BOARD_INSERT = "insert into tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit) "
			+ "values((tb_seq.NEXTVAL), ?, ?, ?, ?, ?)";
	private final String BOARD_UPDATE = "update tip_board set tip_title=?, tip_content=?, tip_img_url=?, tip_video=? " 
			+ "where tip_seq = ?";
	private final String BOARD_UPDATE_HIT = "update tip_board set tip_hit=? " 
			+ "where tip_seq = ?";
	
	private final String BOARD_DELETE = "delete from tip_board where tip_seq = ?";
	private final String BOARD_GET = "select * from tip_board where tip_seq=?";
	private final String BOARD_LIST = "select * from tip_board order by tip_seq desc";
	private final String BOARD_LIST_T = 
			"select * from tip_board where tip_title like ";
	private final String BOARD_LIST_C = 
			"select * from tip_board where tip_content like ";
	
	private final RowMapper<TipVO> TipRowMapper = (resultSet, rowNum) -> {
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
		return tip;
	}
	
	public List<TipVO> getTipList(TipVO vo) {
		String sql = null;
		if (vo.getSearchCondition().equals("TITLE")) {
			sql = BOARD_LIST_T;
		} else if (vo.getSearchCondition().equals("CONTENT")) {
			sql = BOARD_LIST_C;
		}
		
		return jdbcTemplate.query(sql +"'%" + vo.getSearchKeyword() +"%'" + " order by tip_seq desc", TipRowMapper);
	}
}
