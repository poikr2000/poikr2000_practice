package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Component
@Getter @Setter
public class Salary {
	private String empno;
	private String name;
	private String depart;
	private String input_date;
	private String birth_date;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int pay;
	private int extra;
	private int yn; //yes:1, no:9
}
