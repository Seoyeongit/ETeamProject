package com.forpets.biz.customer.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.customer.CustomerService;
import com.forpets.biz.customer.CustomerVO;

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



}
