package com.forpets.biz.reserve.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.reserve.ReserveService;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Override
	public List<ReServeVO> getReserveList(ReServeVO vo){
		return reserveDAO.getReserveList(vo);
	}

	@Override
	public int selectCount() {
		return reserveDAO.selectCount();
	}

	@Override
	public int selectCompleteCount() {
		return reserveDAO.selectCompleteCount();
	}
	
	//230130 최지혁
	//Reserve Table에 데이터 추가
	@Override
	public void insertReserve(ReServeVO vo, PetVO pvo) {
		reserveDAO.insertReserve(vo, pvo);
	}
	
	//230130 최지혁
	//Reserve Table에 데이터 추가를 위한 정보
	@Override
	public ReServeVO makeReserve(ReServeVO vo, HttpServletRequest request) {
		return reserveDAO.makeReserve(vo, request);
	}

}
