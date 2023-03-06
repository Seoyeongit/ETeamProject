package com.forpets.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerRowMapper;
import com.forpets.biz.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String GET_USER ="select * from users where user_id=? and user_pw=?";
	private final String UPDATE_USER ="update USERS set user_pw=?, user_name=?, user_nick=?, user_add=?, phnumber=?, birth=?" + " where user_id = ?";
	private final String INSERT_USER = "INSERT INTO USERS VALUES(?,?,?,?,null,null,?,null,default,(user_seq.NEXTVAL),sysdate)";
	private final String GET_USERBYID = "SELECT * FROM USERS WHERE USER_ID=?";
	private final String GET_JOINPERIOD = "select trunc(sysdate-data_create)from users where user_id=?";
	private final String GET_MULTIPARTINFO = "SELECT * FROM partners WHERE part_id=(SELECT part_id FROM (SELECT part_id, COUNT(DISTINCT reserve_num) FROM reserve WHERE user_id = ? GROUP BY part_id  ORDER BY 2 DESC FETCH FIRST 1 ROWS ONLY))";
	private final String CNT_MULTIPARTTIME = "select * from (select count(distinct reserve_num) from reserve where user_id = ? group by part_id order by 1 desc fetch first 1 rows only)";
	private final String GET_MULTISERV = "select s_name from serv where s_num = (select s_num from(select s_num, count(s_num) from reserve where s_num in (1,2,4,5,8)and user_id = ? group by s_num order by 2 desc fetch first 1 rows only ))";
	private final String CNT_COMMUNITYPRT = "select count(*) from (select distinct sa_svcode,user_id from survey_answer where user_id = ? group by user_id, sa_svcode)";
	private final String CNT_TOTALSERV = "select count(distinct reserve_num) from reserve where user_id = ?";
	
	public UserVO getUser(UserVO vo) {
		Object[] obj = {vo.getUser_id(),vo.getUser_pw()};
		return jdbcTemplate.queryForObject(GET_USER,obj, new UserRowMapper());
	}
	
	public void updateUser(UserVO vo) {
		Object[] obj = {vo.getUser_pw(),vo.getUser_name(),vo.getUser_nick(),vo.getUser_add(),vo.getPhnumber(),vo.getBirth(),vo.getUser_id(),};
		jdbcTemplate.update(UPDATE_USER,obj);
	}
	
	public void saveUser(UserVO vo) {
		Object[] obj = {vo.getUser_id(),vo.getUser_pw(),vo.getUser_name(),vo.getUser_nick(),vo.getPhnumber()};
		jdbcTemplate.update(INSERT_USER,obj);
	}
	
	public UserVO getUserById(UserVO vo) {
		Object[] obj = {vo.getUser_id()};
		return jdbcTemplate.queryForObject(GET_USERBYID, obj,new UserRowMapper());
	}
	
	public int cntUserJoinPeriod(String user_id) {
		Object[] obj = {user_id};
		return jdbcTemplate.queryForObject(GET_JOINPERIOD, obj, Integer.class);
	}
	
	public PartnerVO multipleTimesPart(String user_id) {
		Object[] obj = {user_id};
		return jdbcTemplate.queryForObject(GET_MULTIPARTINFO, obj, new PartnerRowMapper());
	}
	
	public int cntMultiPleTime(String user_id) {
		Object[] obj = {user_id};
		return jdbcTemplate.queryForObject(CNT_MULTIPARTTIME, obj, Integer.class);
	}
	
	public String getMultiPleServ(String user_id) {
		Object[] obj = {user_id};
		return jdbcTemplate.queryForObject(GET_MULTISERV, obj, String.class);
	}
	
	public int cntCommunityPrt(String user_id) {
		Object[] obj = {user_id};
		return jdbcTemplate.queryForObject(CNT_COMMUNITYPRT, obj, Integer.class);
	}
	
	public int cntTotalServe(String user_id) {
		Object[] obj = {user_id};
		return jdbcTemplate.queryForObject(CNT_TOTALSERV, obj, Integer.class);
	}
}
