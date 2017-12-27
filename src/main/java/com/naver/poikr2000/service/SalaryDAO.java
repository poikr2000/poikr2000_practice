package com.naver.poikr2000.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.poikr2000.entities.Salary;
import com.naver.poikr2000.entities.SalaryRegister;
import com.naver.poikr2000.entities.SalaryRoll;

public interface SalaryDAO {
	int empnoConfirm(String empno);
	int insertRow (Salary salary);
	int deleteRow(String empno);
	ArrayList<Salary> selectListAll();
	Salary selectGetOne(String empno);
	int updateRow(Salary salary);
	ArrayList<Salary> selectAllForNew();
	void salaryrollDelete(HashMap yyyymm);
	int salaryrollInsertRow(SalaryRoll salaryroll);
	ArrayList<SalaryRoll> salaryTaxList(HashMap yyyymm);
	ArrayList<SalaryRegister> salaryRegister(HashMap yyyymm);
	SalaryRoll salaryTaxDetail(SalaryRoll roll);
	
}
