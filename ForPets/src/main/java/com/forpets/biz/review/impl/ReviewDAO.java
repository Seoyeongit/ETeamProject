package com.forpets.biz.review.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.review.ReviewVO;
import com.forpets.biz.user.UserVO;

@Repository
public class ReviewDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String INSERT_REVIEW = "insert into review values(r_seq.nextval,?,?,?,sysdate,?)";
	private final String COUNT_REVIEW = "select count(r_id) from review,reserve where review.reserve_num = reserve.reserve_num and reserve.user_id = ?";
	
	public void insertReview(ReviewVO vo) {
		Object[] obj = {vo.getStar_rating(),vo.getR_content(),vo.getR_title(),vo.getReserve_num()};
		jdbcTemplate.update(INSERT_REVIEW,obj);
	}
	
	public int countReview(ReServeVO vo) {
		int countR = 0;
		Object[] obj = {vo.getUser_id()};
		countR = jdbcTemplate.queryForObject(COUNT_REVIEW,obj, Integer.class);
		return countR;
	}


}
