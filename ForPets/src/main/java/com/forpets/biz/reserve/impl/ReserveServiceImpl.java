package com.forpets.biz.reserve.impl;

import com.forpets.biz.reserve.ReserveVO;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.reserve.ReserveService;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Override
	public void insertReserve(ReserveVO vo) {
		reserveDAO.insertReserve(vo);
	}
	
	@Override
	public ReserveVO makeReserve(ReserveVO vo, HttpServletRequest request) {
		return reserveDAO.makeReserve(vo, request);
	}

}
