package com.naver.poikr2000;

import java.util.ArrayList;
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

import com.naver.poikr2000.entities.Balance;
import com.naver.poikr2000.entities.Buy;
import com.naver.poikr2000.entities.Product;
import com.naver.poikr2000.entities.Vender;
import com.naver.poikr2000.service.ProductDAO;

@Controller
public class ProductController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Product product;
	@Autowired
	Vender vender;
	@Autowired
	Buy buy;
	
	@RequestMapping(value = "productSelected", method = RequestMethod.POST)
	@ResponseBody
	 public Product productSelected(@RequestParam String productcode) {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		Product product = dao.selectOne(productcode);
		return product;
	}
	@RequestMapping(value = "productInsertForm", method = RequestMethod.GET)
	 public String productInsertForm() {
		return "product/product_insert";
	}
	@RequestMapping(value = "balanceForm", method = RequestMethod.GET)
	 public ModelAndView balanceForm() {
		ModelAndView mav = new ModelAndView("product/product_balance");
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		ArrayList<Balance>balances = dao.balanceListAll();
		mav.addObject("balances",balances);
		return mav;
	}
	@RequestMapping(value = "balanceDetail", method = RequestMethod.GET)
	 public ModelAndView balanceDetail(@RequestParam String yyyy,@RequestParam String vendcode) {
		ModelAndView mav = new ModelAndView("product/product_balance_detail");
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		HashMap detailmap = new HashMap();
		detailmap.put("yyyy", yyyy);
		detailmap.put("vendcode", vendcode);
		Balance balance=dao.BalanceSelectGenOne(detailmap);
		mav.addObject("balance",balance);
		return mav;
	}
	@RequestMapping(value = "balanceUpdate", method = RequestMethod.POST)
	 public ModelAndView balanceUpdate(@ModelAttribute("balance")Balance balance) {
		ModelAndView mav = new ModelAndView("product/product_balance");
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		try {
			dao.balanceUpdate(balance);
		} catch (Exception e) {
			System.out.println("----------"+e.getMessage());
		}
		return mav;
	}
	
	@RequestMapping(value = "productInsert", method = RequestMethod.POST)
	 public String productInsert(@ModelAttribute("product")Product product) {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		int result=0;
		String message = "저장되었습니다.";
		try {
			result=dao.insertRow(product);
		}catch(Exception e){
			message=e.getMessage();
		}
		return "redirect:productList";
	}
	
	@RequestMapping(value = "codeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int codeConfirm(@RequestParam String code) {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		int result = 0;
		try {
			result = dao.productConfirm(code);
		}catch(Exception e) {
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "productList", method = RequestMethod.GET)
	 public ModelAndView productList() {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		ModelAndView mav = new ModelAndView("product/product_list");
		ArrayList<Product> product =dao.selectListAll();
		mav.addObject("products",product);
		return mav;
	}
	@RequestMapping(value = "productSelectedDelete", method = RequestMethod.POST)
	 public String productSelectedDelete(@RequestParam ("productunitchk") List<String> productunitchks) {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		ModelAndView mav = new ModelAndView("product/product_list");
		for(String unit : productunitchks) {
			dao.deleteRow(unit);
	    }
		return "redirect:productList";
	}
	@RequestMapping(value = "productDelete", method = RequestMethod.GET)
	 public String productDelete(@RequestParam String code) {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		ModelAndView mav = new ModelAndView("product/product_list");
		dao.deleteRow(code);
		return "redirect:productList";
	}
	
	@RequestMapping(value = "productUpdateForm", method = RequestMethod.GET)
	 public ModelAndView productUpdateForm(@RequestParam String code) {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		ModelAndView mav = new ModelAndView("product/product_update");
		Product product =dao.selectOne(code);
		mav.addObject("product",product);
		return mav;
	}
	@RequestMapping(value = "productUpdate", method = RequestMethod.POST)
	 public String productUpdate(@ModelAttribute("product")Product product) {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		ModelAndView mav = new ModelAndView("product/product_list");
		dao.updateRow(product);
		return "redirect:productList";
	}
	@RequestMapping(value = "taskCloseMonth", method = RequestMethod.POST)
	 public String mmTaskClose(@RequestParam String yyyy,@RequestParam String mm) {
		ModelAndView mav = new ModelAndView("product/product_list");
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		int intmm = Integer.parseInt(mm)+1;
		if(intmm==13) {
			intmm=1;
		}
		String strmm = String.format("%02d",intmm);	
		String columnname = "prebalance"+strmm;
		HashMap closemap = new HashMap();
		closemap.put("yyyy", yyyy);
		closemap.put("columnname", columnname);
		dao.balanceMonthClose(closemap);
		dao.mmTaskClose();
		return "redirect:productList";
	}
	@RequestMapping(value = "taskCloseYear", method = RequestMethod.POST)
	 public String yearTaskClose(@RequestParam String yyyy,@RequestParam String mm) {
		ModelAndView mav = new ModelAndView("product/product_list");
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		int intyyyy=Integer.parseInt(yyyy)+1;
		HashMap yyyyclose = new HashMap();
		yyyyclose.put("yyyy", yyyy);
		yyyyclose.put("newyyyy", intyyyy+"");
		
		ArrayList<Balance> yybalances = dao.balanceYyyyList(yyyyclose);
		dao.balanceYearClose(yybalances);
		dao.yearTaskClose();
		return "redirect:productList";
	}
	
	
}
