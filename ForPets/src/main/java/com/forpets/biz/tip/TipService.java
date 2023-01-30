package com.forpets.biz.tip;

import java.util.List;

/*
 *  팁게시판관련 서비스는 여기서 추상메서드를 추가하세요.
 */
public interface TipService {
	
	void insertTip(TipVO vo);
	
	void updateTip(TipVO vo);
	
	void deleteTip(TipVO vo);
	
	public TipVO getTip(TipVO vo);
	
	public List<TipVO> getTipList(TipVO vo);
	
}
