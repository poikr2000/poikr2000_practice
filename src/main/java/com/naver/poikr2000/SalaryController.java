package com.naver.poikr2000;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.poikr2000.entities.Salary;
import com.naver.poikr2000.entities.SalaryRegister;
import com.naver.poikr2000.entities.SalaryRoll;
import com.naver.poikr2000.service.SalaryDAO;

@Controller
public class SalaryController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Salary salary;
	@Autowired
	SalaryRoll salaryroll;
	
	@RequestMapping(value = "salaryInsertForm", method = RequestMethod.GET)
	 public String salaryInsertForm() {
		return "salary/salary_insert";
	 }
	@RequestMapping(value = "empnoConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int empnoConfirm(@RequestParam String empno) {
		SalaryDAO dao=sqlSession.getMapper(SalaryDAO.class);
		int result = 0;
		try {
			result = dao.empnoConfirm(empno);
		}catch(Exception e) {
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "salaryInsert", method = RequestMethod.POST)
	public ModelAndView salaryInsert(@ModelAttribute("salary")Salary salary) {
		SalaryDAO dao=null;
		int result=0;
		dao=sqlSession.getMapper(SalaryDAO.class);
		String message = "저장되었습니다.";
		try {
			result = dao.insertRow(salary);
		}catch(Exception e){
			message=e.getMessage();
		}
		
		ModelAndView mav = new ModelAndView("login/result");
		
		mav.addObject("msg", message);
		return mav;
	}
	@RequestMapping(value = "salaryList", method = RequestMethod.GET)
	 public ModelAndView salaryList() {
		ModelAndView mav = new ModelAndView("salary/salary_list");
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		ArrayList<Salary> salarys = dao.selectListAll();
		mav.addObject("salarys",salarys);
		return mav;
	}
	@RequestMapping(value = "salaryUpdateForm", method = RequestMethod.GET)
	 public ModelAndView salaryDetailForm(@RequestParam String empno) {
		ModelAndView mav = new ModelAndView("salary/salary_update");
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		Salary salary = dao.selectGetOne(empno);
		mav.addObject("salary",salary);
		return mav;
	 }
	@RequestMapping(value = "salaryUpdate", method = RequestMethod.POST)
	 public String salaryUpdate(@ModelAttribute("salary")Salary salary,RedirectAttributes redirectAttributes) {
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		dao.updateRow(salary);
		return "redirect:salaryList";
	 }
	@RequestMapping(value = "salaryDelete", method = RequestMethod.GET)
	 public String salaryDelete(@RequestParam String empno) {
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		dao.deleteRow(empno);
		return "redirect:salaryList";
	 }
	@RequestMapping(value = "salarySelectedDelete", method = RequestMethod.POST)
	 public String salarySelectedDelete(@RequestParam ("unitchk") List<String> unitchks) {
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		for(String unit : unitchks) {
			dao.deleteRow(unit);
	    }
		return "redirect:salaryList";
	 }
	@RequestMapping(value = "salaryTaxForm", method = RequestMethod.GET)
	 public ModelAndView salaryTaxForm() {
		ModelAndView mav = new ModelAndView("salary/salary_tax");
		return mav;
	 }
	@RequestMapping(value = "salaryTax", method = RequestMethod.POST)
	 public ModelAndView salaryTax(@RequestParam String yyyy,@RequestParam String mm) {
		ModelAndView mav = new ModelAndView("login/result");
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		HashMap yyyymm = new HashMap();
		yyyymm.putIfAbsent("yyyy", yyyy);
		yyyymm.putIfAbsent("mm", mm);
		dao.salaryrollDelete(yyyymm);
		ArrayList<Salary> salarys =dao.selectAllForNew();
		for(Salary salary:salarys) {
			salaryroll.setYyyy(yyyy);
			salaryroll.setMm(mm);
			salaryroll.setEmpno(salary.getEmpno());
			salaryroll.setDepart(salary.getDepart());
			salaryroll.setPartner(salary.getPartner());
			salaryroll.setDependent20(salary.getDependent20());
			salaryroll.setDependent60(salary.getDependent60());
			salaryroll.setDisabled(salary.getDisabled());
			salaryroll.setWomanpower(salary.getWomanpower());
			int pay12=(salary.getPay()+salary.getExtra())*12;
			salaryroll.setPay12(pay12);
			int incomededuction=0;
			if(pay12 <= 5000000) {
				incomededuction = (int) (pay12*0.7);
			}else if(pay12 <= 15000000) {
				incomededuction = (int) (3500000+(pay12-5000000)*0.4);
			}else if(pay12 <= 45000000) {
				incomededuction = (int) (7500000+(pay12-15000000)*0.15);
			}else if(pay12 <= 100000000) {
				incomededuction = (int) (12000000+(pay12-45000000)*0.05);
			}else if(pay12 > 100000000) {
				incomededuction = (int) (14750000+(pay12-100000000)*0.02);
			}
			salaryroll.setIncomededuction(incomededuction);
			int incomeamount = pay12-incomededuction;
			salaryroll.setIncomeamount(incomeamount);
			int family = salary.getPartner()+salary.getDependent20()+salary.getDependent60()+salary.getDisabled()+1;
			int personaldeduction = family*1500000;
			salaryroll.setPersonaldeduction(personaldeduction);
			
			int annuityinsurance=0;
			annuityinsurance = (int) (pay12/12*0.045)*12;
			annuityinsurance = (int) (annuityinsurance*0.01);
			annuityinsurance = (int) (annuityinsurance*100);
			if(annuityinsurance<135000) {
				annuityinsurance=135000;
			}
			if(annuityinsurance>2149200) {
				annuityinsurance=2149200;
			}
			salaryroll.setAnnuityinsurance(annuityinsurance);
			
			int specialdeduction =0;
			if(pay12<=30000000 && family== 1) {
				specialdeduction=(int) (3100000+pay12*0.04);
			}else if(pay12<=30000000 && family== 2) {
				specialdeduction=(int) (3600000+pay12*0.04);
			}else if(pay12<=30000000 && family> 2) {
				specialdeduction=(int) (5000000+pay12*0.07+((pay12-40000000)*0.04));
			}else if(pay12>30000000 && pay12<=45000000 && family== 1) {
				specialdeduction=(int) (3100000+pay12*0.04-((pay12-30000000)*0.05));
			}else if(pay12>30000000 && pay12<=45000000 && family== 2) {
				specialdeduction=(int) (3600000+pay12*0.04-((pay12-30000000)*0.05));
			}else if(pay12>30000000 && pay12<=45000000 && family> 2) {
				specialdeduction=(int) (5000000+pay12*0.07-((pay12-30000000)*0.05)+((pay12-40000000)*0.04));
			}else if(pay12>45000000 && pay12<=70000000 && family== 1) {
				specialdeduction=(int) (3100000+pay12*0.015);
			}else if(pay12>45000000 && pay12<=70000000 && family== 2) {
				specialdeduction=(int) (3600000+pay12*0.02);
			}else if(pay12>45000000 && pay12<=70000000 && family> 2) {
				specialdeduction=(int) (3600000+pay12*0.05+((pay12-40000000)*0.04));
			}else if(pay12>70000000 && pay12<=120000000 && family==1) {
				specialdeduction=(int) (3100000+pay12*0.005);
			}else if(pay12>70000000 && pay12<=120000000 && family==2) {
				specialdeduction=(int) (3600000+pay12*0.01);
			}else if(pay12>70000000 && pay12<=120000000 && family>2) {
				specialdeduction=(int) (5000000+pay12*0.03+((pay12-40000000)*0.04));
			}
			salaryroll.setSpecialdeduction(specialdeduction);
			int standardamount = incomeamount-(personaldeduction+annuityinsurance+specialdeduction);
			salaryroll.setStandardamount(standardamount);
			int calculatedtax =0;
			if(standardamount <=12000000) {
				calculatedtax=(int) (standardamount*0.06);
			}else if(standardamount <=46000000) {
				calculatedtax=(int) (720000+(standardamount-12000000)*0.15);
			}else if(standardamount <=88000000) {
				calculatedtax=(int) (5820000+(standardamount-46000000)*0.24);
			}else if(standardamount <=150000000) {
				calculatedtax=(int) (15900000+(standardamount-88000000)*0.35);
			}else if(standardamount >150000000) {
				calculatedtax=(int) (37600000+(standardamount-150000000)*0.38);
			}else if(standardamount >500000000) {
				calculatedtax=(int) (170600000+(standardamount-500000000)*0.4);
			}
			salaryroll.setCalculatedtax(calculatedtax);
			int incometaxdeduction=0;
			if(calculatedtax <= 500000) {
				incometaxdeduction=(int) (calculatedtax*0.55);
			}else if(calculatedtax > 500000) {
				incometaxdeduction=(int) (275000+(calculatedtax-500000)*0.3);
			}
			if(pay12<=55000000 && incometaxdeduction>660000) {
				incometaxdeduction=660000;
			}
			if(pay12>55000000 && pay12<=70000000 &&incometaxdeduction>630000) {
				incometaxdeduction=630000;
			}
			if(pay12>70000000 &&incometaxdeduction>500000) {
				incometaxdeduction=500000;
			}
			salaryroll.setIncometaxdeduction(incometaxdeduction);
			int decidetax =calculatedtax-incometaxdeduction;
			salaryroll.setDecidetax(decidetax);
			int simpletax = (int) (decidetax/12*0.01);
			simpletax = simpletax*100;
			salaryroll.setSimpletax(simpletax);
			dao.salaryrollInsertRow(salaryroll);
			int finalpay = salary.getPay()+salary.getExtra()-(annuityinsurance+simpletax);
			salaryroll.setFinalpay(finalpay);
		}
		
		return mav;
	 }
	@RequestMapping(value = "salaryTaxDelete", method = RequestMethod.POST)
	 public ModelAndView salaryTaxDelete(@RequestParam String yyyy,@RequestParam String mm) {
		ModelAndView mav = new ModelAndView("login/result");
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		HashMap yyyymm = new HashMap();
		yyyymm.putIfAbsent("yyyy", yyyy);
		yyyymm.putIfAbsent("mm", mm);
		dao.salaryrollDelete(yyyymm);
		return mav;
	 }
	@RequestMapping(value = "salaryTaxList", method = RequestMethod.GET)
	 public ModelAndView salaryTaxList(@RequestParam String yyyy,@RequestParam String mm) {
		ModelAndView mav = new ModelAndView("salary/salary_tax_list");
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		if(yyyy.equals("")&&mm.equals("")) {
			SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
			String date = sm.format(new Date());
			yyyy= date.substring(0,4);
			mm = date.substring(5,7);
		}
		HashMap yyyymm = new HashMap();
		yyyymm.putIfAbsent("yyyy", yyyy);
		yyyymm.putIfAbsent("mm", mm);
		try {
			ArrayList<SalaryRoll> rolls=dao.salaryTaxList(yyyymm);
			mav.addObject("rolls",rolls);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mav;
	 }
	@RequestMapping(value = "salaryTaxDetail", method = RequestMethod.GET)
	 public ModelAndView salaryTaxDetail(@ModelAttribute("roll")SalaryRoll roll) {
		ModelAndView mav = new ModelAndView("salary/salary_tax_detail");
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		SalaryRoll salaryroll= dao.salaryTaxDetail(roll);
		mav.addObject("roll",salaryroll);
		return mav;
	 }
	@RequestMapping(value = "salaryRegister", method = RequestMethod.GET)
	 public ModelAndView salaryRegister(@RequestParam String yyyy,@RequestParam String mm) {
		ModelAndView mav = new ModelAndView("salary/salary_register");
		SalaryDAO dao=null;
		dao=sqlSession.getMapper(SalaryDAO.class);
		if(yyyy.equals("")&&mm.equals("")) {
			SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
			String date = sm.format(new Date());
			yyyy= date.substring(0,4);
			mm = date.substring(5,7);
		}
		HashMap yyyymm = new HashMap();
		yyyymm.putIfAbsent("yyyy", yyyy);
		yyyymm.putIfAbsent("mm", mm);
		try {
			ArrayList<SalaryRegister> registers = dao.salaryRegister(yyyymm);
			mav.addObject("registers",registers);
			mav.addObject("yyyy",yyyy);
			mav.addObject("mm",mm);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mav;
	 }
}
