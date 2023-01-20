package com.forpets.biz.reserve;

import javax.servlet.http.HttpServletRequest;

public interface ReserveService {
	
	void insertReserve(ReserveVO vo);
	
	public ReserveVO makeReserve(ReserveVO vo, HttpServletRequest request);
	
}
