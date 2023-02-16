
package com.forpets.biz.carediary.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.carediary.CareDiaryService;
import com.forpets.biz.carediary.CareDiaryVO;

@Service("careDiaryService")
public class CareDiaryServiceImpl implements CareDiaryService{
	@Autowired
	private CareDiaryDAO careDiaryDAO;

	@Override
	public List<CareDiaryVO> getCareDiary(CareDiaryVO vo, String user_id) {
		return careDiaryDAO.getCareDiary(vo, user_id);
	}

	@Override
	public void insertCareDiary(CareDiaryVO vo) {
		careDiaryDAO.insertCareDiary(vo);
	}

	@Override
	public CareDiaryVO getCareDiaryDetail(int diary_id, String user_id) {
		return careDiaryDAO.getCareDiaryDetail(diary_id, user_id);
	}

}