package com.forpets.biz.reserve;

import javax.servlet.http.HttpServletRequest;

import com.forpets.biz.pet.PetVO;

public interface ReserveService {
	
	public void insertReserve(ReserveVO vo, PetVO pvo);
	
	public ReserveVO makeReserve(ReserveVO vo, HttpServletRequest request);
	
}
