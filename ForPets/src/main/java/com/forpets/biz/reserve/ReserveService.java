package com.forpets.biz.reserve;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.forpets.biz.pet.PetVO;

public interface ReserveService {
	
	//예약내역조회
	List<ReServeVO> getReserveList(ReServeVO vo);
	
	//예약내역 수 조회
	int selectCount();	
	
	//예약완료 수 조회
	int selectCompleteCount();
	
	//230130 최지혁
	//Reserve Table에 데이터 추가
	public void insertReserve(ReServeVO vo, PetVO pvo);
	
	//230130 최지혁
	//Reserve Table에 데이터 추가를 위한 정보
	public ReServeVO makeReserve(ReServeVO vo, HttpServletRequest request);

}
