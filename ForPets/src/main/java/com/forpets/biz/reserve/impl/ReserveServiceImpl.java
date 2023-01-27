package com.forpets.biz.reserve.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	

}
