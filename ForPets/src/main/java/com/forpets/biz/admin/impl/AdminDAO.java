package com.forpets.biz.admin.impl;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.admin.AdminVO;
import com.forpets.biz.notice.NoticeVO;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;
import com.forpets.biz.tip.TipVO;
import com.forpets.biz.user.UserVO;
import com.forpets.biz.user.impl.UserRowMapper;

@Repository("AdminDAO")
public class AdminDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String GET_ADMIN = "select * from ADMIN where adm_id=? and adm_pw=?";
	private final String USER_LIST = "select * from USERS order by user_id";
	private final String DELETE_USER = "delete from USERS where user_id=?";
	private final String PARTNER_LIST = "select * from PARTNERS order by part_no";
	private final String UPDATE_ADMIN = "update ADMIN set adm_name=?, adm_phone=?, adm_email=?, adm_pw=?"
			+ "where adm_id=?";
	private final String TIP_PREV = "select tip_title, tip_img_url from TIP_BOARD order by tip_seq desc";
	private final String GET_EARNINGS = "SELECT SUM(S_PRICE) FROM SERV RIGHT OUTER JOIN RESERVE USING (S_NUM)";
	private final String GET_USERCOUNT = "SELECT COUNT(*) FROM USERS";
	private final String GET_REVAVG = "select avg(pr_avg) from partner_review";
	private final String MONTHLY_RESERVE = "SELECT TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM') AS year_month, COUNT(*) AS total FROM RESERVE GROUP BY TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM') ORDER BY TO_CHAR(TO_DATE(RESERVE_DAY, 'YYYY/MM/DD'), 'YYYY/MM') ASC";
	
	
	private final RowMapper<AdminVO> adminRowMapper = (resultSet, rowNum) -> {
		AdminVO newvo = new AdminVO();
		newvo.setAdm_id(resultSet.getString("adm_id"));
		newvo.setAdm_pw(resultSet.getString("adm_pw"));
		newvo.setAdm_name(resultSet.getString("adm_name"));
		newvo.setAdm_phone(resultSet.getString("adm_phone"));
		newvo.setAdm_email(resultSet.getString("adm_email"));
		newvo.setAdm_no(resultSet.getInt("adm_no"));
		newvo.setAdm_date(resultSet.getDate("adm_date"));

		return newvo;
	};

	private final RowMapper<AdminVO> statsRowMapper = (resultSet, rowNum) -> {
		AdminVO svo = new AdminVO();
		svo.setYear_month(resultSet.getString("year_month"));
		svo.setMontly_reserve(resultSet.getInt("total"));
		return svo;
	};

	private final RowMapper<PartnerVO> partRowMapper = (resultSet, rowNum) -> {
		PartnerVO pvo = new PartnerVO();
		pvo.setPart_id(resultSet.getString("part_id"));
		pvo.setPart_name(resultSet.getString("part_name"));
		pvo.setPart_nick(resultSet.getString("part_nick"));
		pvo.setPart_add(resultSet.getString("part_add"));
		pvo.setPart_no(resultSet.getInt("part_no"));
		pvo.setBirth(resultSet.getDate("birth"));
		pvo.setData_create(resultSet.getDate("data_create"));
		pvo.setSelf_infor(resultSet.getString("self_infor"));
		pvo.setImg(resultSet.getString("part_img"));
		pvo.setPart_phnumber(resultSet.getString("part_phnumber"));
		return pvo;
	};

	private final RowMapper<TipVO> tipRowMapper = (resultSet, rowNum) -> {
		TipVO tvo = new TipVO();
		tvo.setTip_title(resultSet.getString("tip_title"));
		tvo.setTip_img_url(resultSet.getString("tip_img_url"));
		return tvo;
	};

	// 관리자 정보
	public AdminVO getAdmin(AdminVO vo) {
		Object[] adm = { vo.getAdm_id(), vo.getAdm_pw() };
		try {
			AdminVO admvo = jdbcTemplate.queryForObject(GET_ADMIN, adm, adminRowMapper);
			return admvo;
		} catch (IncorrectResultSizeDataAccessException error) {
			return null;
		}
//		AdminVO admvo = jdbcTemplate.queryForObject(GET_ADMIN, adm, adminRowMapper);
//		return admvo;
	}

	// 관리자 수정
	public void updateAdmin(AdminVO vo) {
		jdbcTemplate.update(UPDATE_ADMIN, vo.getAdm_name(), vo.getAdm_phone(), vo.getAdm_email(), vo.getAdm_pw(),
				vo.getAdm_id());
		System.out.println("---> updateAdmin()");
		System.out.println(vo.getAdm_name() + vo.getAdm_phone() + vo.getAdm_email() + vo.getAdm_pw() + vo.getAdm_id());
	}

	// 회원 목록
	public List<UserVO> getUserList(UserVO uvo) {
		return jdbcTemplate.query(USER_LIST, new UserRowMapper());
	}

	// 파트너 목록
	public List<PartnerVO> getPartList(PartnerVO pvo) {
		return jdbcTemplate.query(PARTNER_LIST, partRowMapper);
	}

	// 팁 게시판 미리보기
	public List<TipVO> getTipPrev(TipVO tvo) {
		System.out.println(tvo.getTip_title() + tvo.getTip_img_url() + tvo.getTip_seq());
		return jdbcTemplate.query(TIP_PREV, tipRowMapper);
	}

	public void deleteUser(UserVO uvo, String user_id) {
		jdbcTemplate.update(DELETE_USER, user_id);
	}

	public int getEarnings() {
		return jdbcTemplate.queryForObject(GET_EARNINGS, Integer.class);
	}
	
	public int getUserCount() {
		return jdbcTemplate.queryForObject(GET_USERCOUNT, Integer.class);
	}
	
	public double getReviewAvg() {
		return jdbcTemplate.queryForObject(GET_REVAVG, Double.class);
	}
	
	public List<AdminVO> getMontlyReserve(AdminVO avo) {
		return jdbcTemplate.query(MONTHLY_RESERVE, statsRowMapper);
	}

	// 소모임 게시판 미리보기

}
