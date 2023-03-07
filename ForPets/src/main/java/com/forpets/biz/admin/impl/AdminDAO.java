package com.forpets.biz.admin.impl;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.admin.AdminVO;
import com.forpets.biz.admin.SearchCriteria_user;
import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.notice.NoticeVO;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;
import com.forpets.biz.tip.SearchCriteria;
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
	private final String COM_PREV = "select * from community order by C_DATE DESC ";
	private final String GET_EARNINGS = "SELECT SUM(S_PRICE) FROM SERV RIGHT OUTER JOIN RESERVE USING (S_NUM)";
	private final String GET_USERCOUNT = "SELECT COUNT(*) FROM USERS";
	private final String GET_REVAVG = "select avg(pr_avg) from partner_review";
	private final String GET_RESERVECOUNT = "SELECT COUNT(*) FROM RESERVE";
	private final String MONTHLY_RESERVE = "SELECT TO_CHAR(TO_DATE(PAY_DATE, 'YYYY/MM/DD'), 'YYYY/MM') AS year_month, COUNT(*) AS total FROM RESERVE GROUP BY TO_CHAR(TO_DATE(PAY_DATE, 'YYYY/MM/DD'), 'YYYY/MM') ORDER BY TO_CHAR(TO_DATE(PAY_DATE, 'YYYY/MM/DD'), 'YYYY/MM') ASC";
	private final String SERVICE_COUNT = "SELECT s_num, count(s_num) AS service from reserve where s_num in(1,2,4,5,8) group by s_num order by 1";
	private final String PARTNER_RANK = "SELECT PARTNERS.PART_ID, PARTNERS.PART_NAME, COUNT(DISTINCT RESERVE.RESERVE_NUM) AS RES_CNT FROM PARTNERS INNER JOIN RESERVE ON PARTNERS.PART_ID = RESERVE.PART_ID GROUP BY PARTNERS.PART_ID, PARTNERS.PART_NAME ORDER BY RES_CNT DESC";
	private final String PARTNER_INFO = "SELECT * FROM PARTNERS WHERE PART_ID=?";
	private final String USER_INFO = "SELECT * FROM USERS WHERE USER_ID=?";

	// paging 처리
	private final String GETTOTALPAGES = "SELECT COUNT(*) FROM USERS WHERE 1 = 1 ";
	private final String GETLISTWITHPAGING = "SELECT USER_ID, USER_NAME, USER_NICK, USER_ADD,GENDER,PHNUMBER,BIRTH,WAR,USER_NO,DATA_CREATE\r\n"
			+ "FROM(SELECT ROWNUM RN, USER_ID, USER_NAME, USER_NICK, USER_ADD,GENDER,PHNUMBER,BIRTH,WAR,USER_NO,DATA_CREATE\r\n"
			+ "FROM USERS\r\n" + "WHERE ROWNUM <= ?*?\r\n" + "ORDER BY SEQ DESC)\r\n" + "WHERE RN > (?-1) * ?";

	// paging 처리 끝

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

	private final RowMapper<AdminVO> piechartRowMapper = (resultSet, rowNum) -> {
		AdminVO svo = new AdminVO();
		svo.setService_count(resultSet.getInt("service"));
		return svo;
	};

	private final RowMapper<PartnerVO> partRankRowMapper = (resultSet, rowNum) -> {
		PartnerVO pvo = new PartnerVO();
		pvo.setPart_id(resultSet.getString("part_id"));
		pvo.setPart_name(resultSet.getString("part_name"));
		pvo.setPart_reserve(resultSet.getInt("res_cnt"));
		return pvo;
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

	private final RowMapper<CommunityVO> comRowMapper = (resultSet, rowNum) -> {
		CommunityVO vo = new CommunityVO();
		vo.setC_code(resultSet.getString("C_CODE"));
		vo.setC_title(resultSet.getString("C_TITLE"));
		vo.setC_content(resultSet.getString("C_CONTENT"));
		vo.setUser_id(resultSet.getString("USER_ID"));
		vo.setC_date(resultSet.getDate("C_DATE"));
		vo.setC_pet(resultSet.getString("C_PET"));

		return vo;
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

	// 소모임 미리보기
	public List<CommunityVO> getComPrev(CommunityVO cvo) {
		return jdbcTemplate.query(COM_PREV, comRowMapper);
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

	public int getReserveCount() {
		return jdbcTemplate.queryForObject(GET_RESERVECOUNT, Integer.class);
	}

	public List<AdminVO> getMontlyReserve(AdminVO avo) {
		return jdbcTemplate.query(MONTHLY_RESERVE, statsRowMapper);
	}

	public List<AdminVO> getServiceCount(AdminVO avo) {
		return jdbcTemplate.query(SERVICE_COUNT, piechartRowMapper);
	}

	public List<PartnerVO> getPartRank(PartnerVO pvo) {
		return jdbcTemplate.query(PARTNER_RANK, partRankRowMapper);
	}

	// paging 처리
	public int getTotalPages(SearchCriteria_user cri) {
		String sql = GETTOTALPAGES;
		if (cri.getSearchCondition().equals("NAME")) {
			sql += "AND USER_NAME LIKE '%" + cri.getSearchKeyword() + "%'";
		}
		if (cri.getSearchCondition().equals("NICKNAME")) {
			sql += "AND USER_NICK LIKE '%" + cri.getSearchKeyword() + "%'";
		}
		if (cri.getSearchCondition().equals("ADD")) {
			sql += "AND USER_ADD LIKE '%" + cri.getSearchKeyword() + "%'";
		}
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	// 글 목록 조회 with paging
	public List<UserVO> getListWithPaging(SearchCriteria_user cri) {
		Object[] orgs = { cri.getPageNum(), cri.getAmount(), cri.getPageNum(), cri.getAmount() };
		return jdbcTemplate.query(GETLISTWITHPAGING, orgs, new UserRowMapper());
	}

	// 글 목록 조회 with paging
	public List<UserVO> getListWithDynamicPaging(SearchCriteria_user cri) {
		System.out.println("getTipListWithDynamicPaging...");
		System.out.println("Condition : " + cri.getSearchCondition());
		System.out.println("Keyword : " + cri.getSearchKeyword());
		String sql_in = "SELECT ROWNUM RN, USER_ID, USER_NAME, USER_NICK, USER_ADD,GENDER,PHNUMBER,BIRTH,WAR,USER_NO,DATA_CREATE "
				+ "FROM ( SELECT * FROM USERS WHERE 1 = 1 ";

		if (cri.getSearchCondition().equals("NAME")) {
			sql_in = sql_in + "AND USER_NAME LIKE '%" + cri.getSearchKeyword() + "%'";
		}
		if (cri.getSearchCondition().equals("NICKNAME")) {
			sql_in = sql_in + "AND USER_NICK LIKE '%" + cri.getSearchKeyword() + "%'";
		}
		if (cri.getSearchCondition().equals("ADD")) {
			sql_in = sql_in + "AND USER_ADD LIKE '%" + cri.getSearchKeyword() + "%'";
		}
		sql_in = sql_in + "ORDER BY USER_NO DESC) WHERE ROWNUM <= " + cri.getPageNum() * cri.getAmount();

		String sql = "SELECT USER_ID, USER_NAME, USER_NICK, USER_ADD,GENDER,PHNUMBER,BIRTH,WAR,USER_NO,DATA_CREATE "
				+ "FROM (" + sql_in + ") WHERE RN > " + (cri.getPageNum() - 1) * cri.getAmount();

		System.out.println("sql : " + sql);

		return jdbcTemplate.query(sql, new UserRowMapper());
	}

	public PartnerVO getPartInfo(PartnerVO pvo, String part_id) {
		return jdbcTemplate.queryForObject(PARTNER_INFO, partRowMapper, part_id);
	}

	public UserVO getUserInfo(UserVO uvo, String user_id) {
		return jdbcTemplate.queryForObject(USER_INFO, new UserRowMapper(), user_id);
	}

}
