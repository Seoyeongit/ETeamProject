package com.forpets.biz.pet;

import java.util.List;

public interface WorkService {
	/**
	 * 좌표를저장합니다.
	 */
	void insertWork(WorkVO vo);
	
	/**
	 * 좌표를삭제합니다.
	 */
	void DeleteWork(WorkVO vo);
	
	/**
	 * 좌표들을불러옵니다.
	 */
	List<WorkVO> ListWork(WorkVO vo);
}
