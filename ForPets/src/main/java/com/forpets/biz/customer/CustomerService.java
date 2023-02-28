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

	// 내 문의 내역 뷰
	public CustomerVO getCustomerBoardView(CustomerVO vo);
	
	// 메인 페이지 검색기능
	public List<CustomerVO> searchCustomerList(CustomerVO vo);
	
	// 댓글 작성
	void insertCustomerRe(CustomerReVO vo);
	
	// 댓글 수정
	void updateCustomerRe(CustomerReVO vo);
	
	// 댓글 보기
	public CustomerReVO getCustomerRe(CustomerReVO vo);
	
	// 페이징
	int getTotalPages(SearchCriteria cri);
	
	// 글 목록 조회 with dynamic(search condition) paging
	List<CustomerVO> getCustomerListWithDynamicPaging(SearchCriteria cri);
}
