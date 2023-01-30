package com.forpets.biz.pet.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.pet.WorkService;
import com.forpets.biz.pet.WorkVO;
import com.forpets.biz.reserve.impl.ReserveRowMapper;

@Service("workService")
public class WorkServiceImpl implements WorkService{
	@Autowired
	private WorkDAO workDAO;

	@Override
	public void insertWork(WorkVO vo) {
		workDAO.insertWork(vo);
	}

	@Override
	public void DeleteWork(WorkVO vo) {
		workDAO.DeleteWork(vo);
	}

	@Override
	public List<WorkVO> ListWork(WorkVO vo) {
		return workDAO.ListWork(vo);

	}

}
