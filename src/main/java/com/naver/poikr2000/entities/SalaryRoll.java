package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Component
@Getter @Setter
public class SalaryRoll {
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
	private int pay;
	private int pay12;
	private int sumpay;
	private int incomededuction;
	private int incomeamount;
	private int personaldeduction;
	private int annuityinsurance;
	private int specialdeduction;
	private int standardamount;
	private int calculatedtax;
	private int incometaxdeduction;
	private int decidetax;
	private int simpletax;
	private int finalpay;
}
