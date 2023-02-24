package com.forpets.biz.review.impl;

import java.util.ArrayList;
import java.util.List;

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
	private final String COUNT_REVIEW = "select count(distinct review.reserve_num) from review,reserve where review.reserve_num = reserve.reserve_num and reserve.user_id = ?";
	private final String GET_RIVEWLIST ="select REVIEW.* " + 
										"FROM REVIEW " + 
										"JOIN RESERVE ON REViEW.RESERVE_NUM = reserve.RESERVE_NUM " + 
										"WHERE RESERVE.USER_ID = ?";
	
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
	
	public List<ReviewVO> getReviewList(ReviewVO vo, String user_id) {
		Object[] obj = {user_id};
		List<ReviewVO> list = jdbcTemplate.query(GET_RIVEWLIST, obj, new ReviewRowMapper());
		List<ReviewVO> newList = new ArrayList<ReviewVO>();
		String number = "";
		
		int count = list.toArray().length;
		for(int i = 0; i<count;i++) {
			ReviewVO rvo = list.get(i);
			if(rvo.getReserve_num().equals(number)) {
				
				System.out.println("같은 예약번호이므로 넘어갑니다.");
				continue;
			}
			System.out.println("다른 예약번호이므로 저장합니다.");
			number = rvo.getReserve_num();
			newList.add(rvo);
		}
		
		return newList;
	}


}
