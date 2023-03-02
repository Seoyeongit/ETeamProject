package com.forpets.biz.customer.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.customer.CustomerReVO;
import com.forpets.biz.customer.CustomerService;
import com.forpets.biz.customer.CustomerVO;
import com.forpets.biz.customer.SearchCriteria;

@Service("customerSerivce") 
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO customerDAO;
	
	@Override
	public CustomerVO customer(CustomerVO vo) {
		return customerDAO.customer(vo);
	}

	@Override
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		return customerDAO.getCustomerList(vo);
	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		customerDAO.insertCustomer(vo);

	}

	@Override
	public void deleteCustomer(CustomerVO vo) {
		customerDAO.deleteCustomer(vo);

	}

	@Override
	public void updateCustomer(CustomerVO vo) {
		customerDAO.updateCustomer(vo);

	}
	
	@Override
	public CustomerVO getCustomerBoard(CustomerVO vo) {
		return customerDAO.getCustomerBoard(vo);
	}
	
	@Override
	public List<CustomerVO> myCustBoard(CustomerVO vo) {
		return customerDAO.myCustBoard(vo);
	}

	@Override
	public CustomerVO getCustomerBoardView(CustomerVO vo) {
		return customerDAO.getCustomerBoardView(vo);
	}
	
	@Override
	public List<CustomerVO> searchCustomerList(CustomerVO vo) {
		return customerDAO.searchCustomerList(vo);
	}
	
	@Override
	public void insertCustomerRe(CustomerReVO vo) {
		customerDAO.insertCustomerRe(vo);
	}
	
	@Override
	public void updateCustomerRe(CustomerReVO vo) {
		customerDAO.updateCustomerRe(vo);
	}
	
	@Override
	public CustomerReVO getCustomerRe(CustomerReVO vo) {
		return customerDAO.getCustomerRe(vo);
	}
	
	@Override
	public List<CustomerVO> getCustomerListWithDynamicPaging(SearchCriteria cri) {
		return customerDAO.getCustomerListWithDynamicPaging(cri);
	}
	
	@Override
	public int getTotalPages(SearchCriteria cri) {
		return customerDAO.getTotalPages(cri);
	}
	
	@Override
	public int getMyPages(SearchCriteria cri, CustomerVO vo) {
		return customerDAO.getMyPages(cri, vo);
	}
	
	@Override
	public List<CustomerVO> getMyListWithDynamicPaging(SearchCriteria cri) {
		return customerDAO.getMyListWithDynamicPaging(cri);
	}
}
