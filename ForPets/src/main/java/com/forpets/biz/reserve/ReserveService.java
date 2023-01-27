package com.forpets.biz.reserve;

import java.util.List;

public interface ReserveService {
	
	//예약내역조회
	List<ReServeVO> getReserveList(ReServeVO vo);
	
	//예약내역 수 조회
	int selectCount();	
	
	//예약완료 수 조회
	int selectCompleteCount();

}
