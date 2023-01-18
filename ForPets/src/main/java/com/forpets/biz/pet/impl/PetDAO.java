package com.forpets.biz.pet.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.tip.TipVO;

@Repository("petDAO")
public class PetDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// SQL 명령어들
	private final String PET_GET = "select * from USER_PET where USER_ID = ? AND pet_ID = ?";
//	private final String PET_LIST = "select * from USER_PET where USER_ID = ? order by pet_id desc";
	
	private final RowMapper<PetVO> PetRowMapper = (resultSet, rowNum) -> {		
		PetVO newPet = new PetVO();
		newPet.setId(resultSet.getInt("PET_ID"));
		newPet.setName(resultSet.getString("PET_NAME"));
		newPet.setType(resultSet.getString("PET_TYPE"));
		newPet.setAge(resultSet.getInt("PET_AGE"));
		newPet.setWark(resultSet.getString("PET_WORK"));
		newPet.setGender(resultSet.getString("PET_GENDER").charAt(0));
		newPet.setUser_id(resultSet.getString("USER_ID"));
		return newPet;
	};
	
	// CRUD 기능의 메소드 구현
	public PetVO getPet(PetVO pvo, String user_id) {
		System.out.println("---> JDBC로 getPet() 기능 처리");
		PetVO pet = jdbcTemplate.queryForObject(PET_GET, 
				(resultSet, rowNum) -> {
					PetVO newPet = new PetVO();
					newPet.setId(resultSet.getInt("PET_ID"));
					newPet.setName(resultSet.getString("PET_NAME"));
					newPet.setType(resultSet.getString("PET_TYPE"));
					newPet.setAge(resultSet.getInt("PET_AGE"));
					newPet.setWark(resultSet.getString("PET_WORK"));
					newPet.setGender(resultSet.getString("PET_GENDER").charAt(0));
					newPet.setUser_id(resultSet.getString("USER_ID"));
					return newPet;
				}
				, user_id);
		return pet;
	}
	
	public List<PetVO> getPetList(PetVO vo, String user_id) {
		System.out.println("---> JDBC로 getPetList() 기능 처리");
		return jdbcTemplate.query("select * from USER_PET where USER_ID =" + user_id + "order by pet_id desc",PetRowMapper);
	}
	
}
