package com.forpets.biz.comdat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.comdat.ComdatVO;

@Repository("comdatDAO")
public class ComdatDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 댓글 조회
	private final String GET_DAT = "select * from comdat where d_code=?";
	
	// 댓글 등록
	private final String INSERT_DAT = "insert into comdat (D_NUM, D_CODE, USER_ID, D_CONTENT, D_DATE) VALUES ((cd_seq.NEXTVAL), ?, ?, ? , sysdate)";
	
	// 댓글 수정
	private final String UPDATE_DAT = "update comdat set D_CONTENT=? where d_code=? and d_num=?";
	
	// 댓글 삭제
	private final String DELETE_DAT = "delete from comdat where d_code =? and d_num = ?";
	
	
	// 댓글 조회
	private final RowMapper<ComdatVO> comdatRowMapper = (resultSet, rowNum) -> {
		ComdatVO vo = new ComdatVO();
		vo.setD_num(resultSet.getInt("D_NUM"));
		vo.setD_code(resultSet.getString("D_CODE"));
		vo.setUser_id(resultSet.getString("USER_ID"));
		vo.setD_content(resultSet.getString("D_CONTENT"));
		vo.setD_date(resultSet.getDate("D_DATE"));
		
		return vo;
	};
	
	public List<ComdatVO> getdat(String c_code) {
		return jdbcTemplate.query(GET_DAT, comdatRowMapper, c_code);
	} // 댓글 조회 end
	
	// 댓글 등록
	public void insertComdat(ComdatVO vo) {
		jdbcTemplate.update(INSERT_DAT, vo.getD_code(), vo.getUser_id(), vo.getD_content());
	}
	
	// 댓글 수정
	public void updateComdat(ComdatVO vo) {
		jdbcTemplate.update(UPDATE_DAT, vo.getD_content(), vo.getD_code(), vo.getD_num());
	}
	
	// 댓글 삭제
	public void deleteComdat(ComdatVO vo) {
		jdbcTemplate.update(DELETE_DAT, vo.getD_code(), vo.getD_num());
	}
		
		
}