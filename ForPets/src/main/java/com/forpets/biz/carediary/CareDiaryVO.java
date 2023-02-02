package com.forpets.biz.carediary;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.user.UserVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 *  돌봄일지모듈입니다.
 */


@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter @Setter
public class CareDiaryVO {
	private int dia_id; //돌봄일지id
	private int reserve_num; //예약id
	private String care_content; //돌봄일지내용
	private PetVO voP;
	private UserVO voU;
	private ReServeVO voR;
}