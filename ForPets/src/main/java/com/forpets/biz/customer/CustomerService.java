package com.forpets.biz.customer;

import java.util.List;

import com.forpets.biz.customer.CustomerVO;;

public interface CustomerService {
	
	public CustomerVO customer(CustomerVO vo);
	
	// 고객센터 글 목록 보기
	public List<CustomerVO> getCustomerList(CustomerVO vo);
	
	// 글 보기
	public CustomerVO getCustomerBoard(CustomerVO vo);
	
	// 고객센터 글 쓰기
	void insertCustomer(CustomerVO vo);
	
	// 고객센터 글 삭제
	void deleteCustomer(CustomerVO vo);
	
	// 고객센터 글 수정
	void updateCustomer(CustomerVO vo);
	
	// 내 문의 내역 보기
	public List<CustomerVO> myCustBoard(CustomerVO vo);

	public CustomerVO getCustomerBoardView(CustomerVO vo);
	
}
