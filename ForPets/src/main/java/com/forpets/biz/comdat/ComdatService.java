package com.forpets.biz.comdat;
/*
 *  댓글관련 서비스는 여기서 추상메서드를 추가하세요.
 */

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ComdatService {

	// 댓글 불러오기 
	public List<ComdatVO> getComdat(String c_code) throws Exception;
	
	// 댓글 작성하기 
	public void insertComdat(ComdatVO vo);
}
