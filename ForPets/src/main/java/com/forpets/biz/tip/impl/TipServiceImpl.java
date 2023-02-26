package com.forpets.biz.tip.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.tip.SearchCriteria;
import com.forpets.biz.tip.TipService;
import com.forpets.biz.tip.TipVO;

@Service("TipService")
public class TipServiceImpl implements TipService {

	@Autowired
	private TipDAO tipDAO;
	
	@Override
	public void insertTip(TipVO vo) {
		tipDAO.insertTip(vo);
	}

	@Override
	public void updateTip(TipVO vo) {
		tipDAO.updateTip(vo);
	}

	@Override
	public void deleteTip(TipVO vo) {
		tipDAO.deleteTip(vo);
	}

	@Override
	public TipVO getTip(TipVO vo) {
		return tipDAO.getTip(vo);
	}

	/*
	@Override
	public List<TipVO> getTipList(TipVO vo) {
		return tipDAO.getTipList(vo);
	}
	*/
	
	@Override
	public int getTotalPages(SearchCriteria cri) {
		return tipDAO.getTotalPages(cri);
	}

	@Override
	public List<TipVO> getTipListWithPaging(SearchCriteria cri) {
		return tipDAO.getTipListWithPaging(cri);
	}

	@Override
	public List<TipVO> getTipListWithDynamicPaging(SearchCriteria cri) {
		return tipDAO.getTipListWithDynamicPaging(cri);
	}

}
