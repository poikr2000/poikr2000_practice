package com.naver.poikr2000;

import java.util.ArrayList;
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

import com.naver.poikr2000.entities.Buy;
import com.naver.poikr2000.entities.Product;
import com.naver.poikr2000.entities.Vender;
import com.naver.poikr2000.service.VenderDAO;

@Controller
public class VenderController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Product product;
	@Autowired
	Vender vender;
	@Autowired
	Buy buy;
	@RequestMapping(value = "venderInsertForm", method = RequestMethod.GET)
	 public String venderInsertForm() {
		return "product/vender_insert";
	}
	@RequestMapping(value = "venderInsert", method = RequestMethod.POST)
	 public ModelAndView venderInsert(@ModelAttribute("vender")Vender vender) {
		VenderDAO dao=sqlSession.getMapper(VenderDAO.class);
		int result=0;
		String message = "저장되었습니다.";
		try {
			dao.venderInsertRow(vender);
		}catch(Exception e){
			message=e.getMessage();
		}
		ModelAndView mav = new ModelAndView("login/result");
		mav.addObject(message);
		return mav;
	}
	@RequestMapping(value = "venderConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int venderConfirm(@RequestParam String code) {
		VenderDAO dao=sqlSession.getMapper(VenderDAO.class);
		int result=0;
		try {
			result=dao.venderConfirm(code);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "venderList", method = RequestMethod.GET)
	 public ModelAndView venderList() {
		VenderDAO dao=sqlSession.getMapper(VenderDAO.class);
		ModelAndView mav = new ModelAndView("product/vender_list");
		ArrayList<Vender> vender =dao.venderSelectListAll();
		mav.addObject("venders",vender);
		return mav;
	}
	@RequestMapping(value = "venderSelectedDelete", method = RequestMethod.POST)
	 public String venderSelectedDelete(@RequestParam ("venderunitchk") List<String> venderunitchks) {
		VenderDAO dao=sqlSession.getMapper(VenderDAO.class);
		for(String unit : venderunitchks) {
			dao.venderDeleteRow(unit);
	    }
		return "redirect:venderList";
	}
	@RequestMapping(value = "venderUpdateForm", method = RequestMethod.GET)
	 public ModelAndView venderUpdateForm(@RequestParam String code) {
		VenderDAO dao=sqlSession.getMapper(VenderDAO.class);
		ModelAndView mav = new ModelAndView("product/vender_update");
		Vender vender =dao.venderSelectOne(code);
		mav.addObject("vender",vender);
		return mav;
	}
	@RequestMapping(value = "venderUpdate", method = RequestMethod.POST)
	 public String venderUpdate(@ModelAttribute("vender")Vender vender) {
		VenderDAO dao=sqlSession.getMapper(VenderDAO.class);
		dao.venderUpdateRow(vender);
		return "redirect:venderList";
	}
	@RequestMapping(value = "venderDelete", method = RequestMethod.GET)
	 public String venderDelete(@RequestParam String code) {
		VenderDAO dao=sqlSession.getMapper(VenderDAO.class);
		dao.venderDeleteRow(code);
		return "redirect:venderList";
	}
}
