package com.forpets.biz.reserve;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.forpets.biz.pet.PetVO;

public interface ReserveService {
	
	//특정예약내역조회
	ReServeVO getReserve(ReServeVO vo);
	
	//예약내역조회
	List<ReServeVO> getReserveList(ReServeVO vo);
	
	//완료된예약내역조회
	List<ReServeVO> getCPTReserveList(ReServeVO vo);
	
	//예약내역 수 조회
	int selectCount(ReServeVO vo);	
	
	//예약완료 수 조회
	int selectCompleteCount(ReServeVO vo);
	
	int selectIngCount(ReServeVO vo);
	
	int selectBeforeCount(ReServeVO vo);
	
	//230130 최지혁
	//Reserve Table에 데이터 추가
	public void insertReserve(ReServeVO vo, PetVO pvo);
	
	//230130 최지혁
	//Reserve Table에 데이터 추가를 위한 정보
	public ReServeVO makeReserve(ReServeVO vo, HttpServletRequest request);
	
	public List<ReServeVO> reserveDetailLIst(ReServeVO vo);
	
	
	// 230217 정영현
	public List<ReServeVO> getReserveListPart(ReServeVO vo);
	
	public ReServeVO getReserveDetail(ReServeVO vo);
	
	public List<ReServeVO> getReserveListCare(ReServeVO vo);
	
}
