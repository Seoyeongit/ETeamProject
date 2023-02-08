package com.forpets.biz.review.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.review.ReviewVO;

public class ReviewRowMapper implements RowMapper<ReviewVO> {

	@Override
	public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		return null;
	}

}
