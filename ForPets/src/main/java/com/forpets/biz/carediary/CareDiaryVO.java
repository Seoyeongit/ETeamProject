package com.forpets.biz.carediary;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  돌봄일지모듈입니다.
 */


@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class CareDiaryVO {
	private int dia_id; //돌봄일지id
	private int reserve_num; //예약id
	private String care_content; //돌봄일지내용
}
