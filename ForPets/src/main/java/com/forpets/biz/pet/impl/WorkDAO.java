package com.forpets.biz.pet.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.pet.WorkVO;
import com.forpets.biz.reserve.impl.ReserveRowMapper;

@Repository("workDAO")
public class WorkDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String SELECT_WORKLIST ="SELECT str_user_id, x, y, id " + 
											"FROM user_work, TABLE(SDO_UTIL.GETVERTICES(user_work.geom)) " + 
											"WHERE STR_USER_ID=? " + 
											"order by id";
	
	private final String DELETE_WORK = "delete from user_work where str_user_id=?"; 
	
	
	public void insertWork(WorkVO vo) {
	    String query = "INSERT INTO user_work (str_user_id,geom) " +
	                   "VALUES (:user_id, SDO_GEOMETRY(2003, 4326, NULL, " +
	                   "SDO_ELEM_INFO_ARRAY(1,1003,3), " +
	                   "SDO_ORDINATE_ARRAY(:x, :y)))";

	    int index = vo.getXArr().length;
	    float[] X = vo.getXArr();
	    float[] Y = vo.getYArr();

	    NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);

	    for (int i = 0; i < index; i++) {
	        Map<String, Object> parameters = new HashMap<>();
	        parameters.put("user_id", vo.getUser_id());
	        parameters.put("x", X[i]);
	        parameters.put("y", Y[i]);

	        namedParameterJdbcTemplate.update(query, parameters);
	    }
	}
	
	public void DeleteWork(WorkVO vo) {
		System.out.println("---> jdbcTemplate로 DeleteWork() 기능처리 ");
		jdbcTemplate.update(DELETE_WORK,vo.getUser_id());
	}

	
	public List<WorkVO> ListWork(WorkVO vo) {
		System.out.println("---> jdbcTemplate로  ListWork() 기능 처리");
		
		Object[] orgs = {vo.getUser_id()};
		return jdbcTemplate.query(SELECT_WORKLIST,orgs,new WorkRowMapper());
	}

}
