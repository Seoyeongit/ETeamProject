package com.forpets.biz.reserve;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  예약모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class ReserveVO {
	private int reserve_num; //예약번호
	private String reserve_day; //예약날짜
	private String reserve_time; //예약시간
	private String reserve_add; //예약주소
	private int s_num; //서비스번호
	private String user_id; //회원번호
	private String part_id; //파트너아이디
	private int pet_id; //펫아이디
}
