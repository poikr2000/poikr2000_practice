package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
@Getter @Setter
public class SalaryRegister {
	private String yyyy;
	private String mm;
	private String empno;
	private String name;
	private String depart;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int mmpay;
	private int insurance;
	private int tax;
	private int finalpay;
}
