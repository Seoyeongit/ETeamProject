
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
	public List<CareDiaryVO> getCareDiary(CareDiaryVO vo) {
		return careDiaryDAO.getCareDiary(vo);
	}

}