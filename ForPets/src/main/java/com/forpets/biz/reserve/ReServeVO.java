package com.forpets.biz.reserve;

import java.util.Date;

import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.pet.PetVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 *  예약모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter @Setter
public class ReServeVO {
	private int re_seq;
	private String reserve_num; //예약번호
	private String reserve_day; //예약날짜
	private String reserve_time; //예약시간
	private String reserve_add; //예약주소
	private int s_num; //서비스번호
	private String user_id; //회원번호
	private String part_id; //파트너아이디
	private int pet_id; //펫아이디
	private int status; //예약상태 1:매칭중 2:매칭완료/케어중 3:케어완료
	private PetVO voPet;
	private PartnerVO voP;
	private String pick_add; // pickup 시 사용할 주소
	private String reserve_request;
	private int[] s_numArr;
}
