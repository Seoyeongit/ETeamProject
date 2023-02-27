package com.forpets.biz.customer.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.customer.CustomerVO;

@Repository("customerDAO")
public class CustomerDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String GET_CUSTOMER = "select * from CUSTOMER WHERE CUST_NO = ?";
	private final String MYCUSTOMER_BOARD = "select * from CUSTOMER where USER_ID=? or PART_ID =?";
	private final String CUSTOMER_LIST = "select * from CUSTOMER order by CUST_NO DESC ";
	private final String CUSTOMER_LIST_T = "select * from CUSTOMER where cust_title like ";
	private final String CUSTOMER_LIST_C = "select * from CUSTOMER where cust_content like ";
	private final String INSERT_CUSTOMER = "INSERT INTO CUSTOMER (CUST_NO, USER_ID, PART_ID, CUST_TITLE, CUST_CONTENT) VALUES((cust_seq.NEXTVAL),?,?,?,?)";
	private final String DELETE_CUSTOMER = "DELETE FROM CUSTOMER where CUST_NO=? ";
	private final String UPDATE_CUSTOMER = "UPDATE CUSTOMER set CUST_TITLE=?, CUST_CONTENT=? where CUST_NO=?";
	
	
	private final RowMapper<CustomerVO> customerRowMapper = (resultSet, rowNum) -> {
		CustomerVO vo = new CustomerVO();
		vo.setCust_no(resultSet.getInt("CUST_NO"));
		vo.setUser_id(resultSet.getString("USER_ID"));
		vo.setPart_id(resultSet.getString("PART_ID"));
		vo.setCust_title(resultSet.getString("CUST_TITLE"));
		vo.setCust_content(resultSet.getString("CUST_CONTENT"));
		vo.setCust_date(resultSet.getDate("CUST_DATE"));
		
		return vo;
	};
	
	public CustomerVO customer(CustomerVO vo) {
		CustomerVO voo = jdbcTemplate.queryForObject(CUSTOMER_LIST,
			(resultSet, rowNum) -> {
				CustomerVO cvo = new CustomerVO();
				cvo.setCust_no(resultSet.getInt("CUST_NO"));
				cvo.setUser_id(resultSet.getString("USER_ID"));
				cvo.setPart_id(resultSet.getString("PART_ID"));
				cvo.setCust_title(resultSet.getString("CUST_TITLE"));
				cvo.setCust_content(resultSet.getString("CUST_CONTENT"));
				cvo.setCust_date(resultSet.getDate("CUST_DATE"));
				return cvo;
			}
			, vo);
		return voo;
	} 
	
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		String sql = null;
		if (vo.getSearchCondition().equals("TITLE")) {
			sql = CUSTOMER_LIST_T;
		} else if (vo.getSearchCondition().equals("CONTENT")) {
			sql = CUSTOMER_LIST_C;
		}
		
		return jdbcTemplate.query(sql +"'%" + vo.getSearchKeyword() +"%'" + " order by cust_no desc", customerRowMapper);
	}
	
	public void insertCustomer(CustomerVO vo) {
		System.out.println("user_id : " + vo.getUser_id());
		System.out.println("part_id : " + vo.getPart_id());
		if(vo.getUser_id()==null) {
			vo.setUser_id(" ");
			System.out.println("user_id : " + vo.getUser_id());
		}if(vo.getPart_id()==null){
			vo.setPart_id(" ");
			System.out.println("part_id : " + vo.getPart_id());
		}
		jdbcTemplate.update(INSERT_CUSTOMER, vo.getUser_id(), vo.getPart_id(), vo.getCust_title(), vo.getCust_content());
	}
	
	public void updateCustomer(CustomerVO vo) {
		jdbcTemplate.update(UPDATE_CUSTOMER, vo.getCust_title(), vo.getCust_content(), vo.getCust_no());
	}

	public void deleteCustomer(CustomerVO vo) {
		jdbcTemplate.update(DELETE_CUSTOMER, vo.getCust_no());

	}
	
	public CustomerVO getCustomerBoard(CustomerVO vo) {
		Object[] orgs = {vo.getCust_no() };
		return jdbcTemplate.queryForObject(GET_CUSTOMER, orgs, new CustomerRowMapper());
	}
	
	public CustomerVO getCustomerBoardView(CustomerVO vo) {
		Object[] orgs = {vo.getCust_no() };
		return jdbcTemplate.queryForObject(GET_CUSTOMER, orgs, new CustomerRowMapper());
	}
	
	public List<CustomerVO> myCustBoard(CustomerVO vo) {
		Object[] orgs = {vo.getUser_id(),vo.getPart_id()};
		return jdbcTemplate.query(MYCUSTOMER_BOARD,orgs, new CustomerRowMapper());
	}
	

	
}
