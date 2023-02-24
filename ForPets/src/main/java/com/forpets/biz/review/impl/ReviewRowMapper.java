package com.forpets.biz.review.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.review.ReviewVO;

public class ReviewRowMapper implements RowMapper<ReviewVO> {

	@Override
	public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewVO vo = new ReviewVO();
		
		vo.setR_id(rs.getInt("R_ID"));
		vo.setStar_rating(rs.getInt("STAR_RATING"));
		vo.setR_content(rs.getString("R_CONTENT"));
		vo.setR_title(rs.getString("R_TITLE"));
		vo.setR_date(rs.getDate("R_DATE"));
		vo.setReserve_num(rs.getString("RESERVE_NUM"));
		return vo;
	}

}
