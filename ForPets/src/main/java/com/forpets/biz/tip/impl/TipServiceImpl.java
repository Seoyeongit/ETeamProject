package com.forpets.biz.tip.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public List<TipVO> getTipList(TipVO vo) {
		return tipDAO.getTipList(vo);
	}

}
