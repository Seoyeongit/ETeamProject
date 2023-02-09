package com.forpets.biz.review.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.review.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String INSERT_REVIEW = "insert into review values(r_seq.nextval,?,?,?,sysdate,?)";
	
	public void insertReview(ReviewVO vo) {
		Object[] obj = {vo.getStar_rating(),vo.getR_content(),vo.getR_title(),vo.getReserve_num()};
		jdbcTemplate.update(INSERT_REVIEW,obj);
	}

}
