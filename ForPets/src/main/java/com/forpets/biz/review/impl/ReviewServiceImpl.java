package com.forpets.biz.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.review.ReviewService;
import com.forpets.biz.review.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public int countReview(ReServeVO vo) {
		return reviewDAO.countReview(vo);
	}
	
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo,String user_id) {
		return reviewDAO.getReviewList(vo,user_id);
	}

}
