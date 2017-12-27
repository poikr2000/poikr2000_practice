package com.naver.poikr2000;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import com.naver.poikr2000.entities.BuySearch;
import com.naver.poikr2000.entities.Product;
import com.naver.poikr2000.entities.Vender;
import com.naver.poikr2000.service.BuyDAO;
import com.naver.poikr2000.service.ProductDAO;
import com.naver.poikr2000.service.VenderDAO;

@Controller
public class BuyController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Product product;
	@Autowired
	Vender vender;
	@Autowired
	Buy buy;
	
	@RequestMapping(value = "buyInsert", method = RequestMethod.POST)
	 public ModelAndView buyInsert(@ModelAttribute("buy")Buy buy) {
		BuyDAO dao=sqlSession.getMapper(BuyDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		VenderDAO venderdao=sqlSession.getMapper(VenderDAO.class);
		try {
			dao.buyInsertRow(buy);
			buy.setColumnname("buy"+buy.getMm());
			productdao.buyProductAdd(buy);
			buy.setDealname("deal"+buy.getMm());
			buy.setBalancename("balance"+buy.getMm());
			dao.buyBalanceAdd(buy);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		ArrayList<Vender> vender =venderdao.venderSelectBuyListAll();
		ArrayList<Product> product =productdao.selectListAll();
		
		buy.setHang(buy.getHang()+1);
		ModelAndView mav = new ModelAndView("product/product_buy");
		mav.addObject("venders",vender);
		mav.addObject("products",product);
		mav.addObject("buy",buy);
		ArrayList<Buy> buys = dao.buySelectListAll(buy);
		mav.addObject("buys",buys);
		
		return mav;
	}
	@RequestMapping(value = "taskCloseForm", method = RequestMethod.GET)
	 public ModelAndView taskCloseForm() {
		ModelAndView mav = new ModelAndView("product/task_close");
		return mav;
	}
	@RequestMapping(value = "productBuyForm", method = RequestMethod.GET)
	 public ModelAndView productBuyForm() {
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		VenderDAO venderdao=sqlSession.getMapper(VenderDAO.class);
		ModelAndView mav = new ModelAndView("product/product_buy");
		ArrayList<Vender> venders =venderdao.venderSelectBuyListAll();
		ArrayList<Product> products =productdao.selectListAll();
		mav.addObject("venders",venders);
		mav.addObject("products",products);
		return mav;
	}
	@RequestMapping(value = "buyNew", method = RequestMethod.POST)
	@ResponseBody
	 public Buy buyNew(@RequestParam String vendcode) {
		BuyDAO dao=sqlSession.getMapper(BuyDAO.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		String yyyy= date.substring(0,4);
		String mm = date.substring(5,7);
		String dd = date.substring(8,10);
		buy.setYyyy(yyyy);
		buy.setMm(mm);
		buy.setDd(dd);
		buy.setVendcode(vendcode);
		int no = dao.selectSequenceNo(buy);
		buy.setNo(no);
		buy.setHang(1);
		return buy;
	}
	@RequestMapping(value = "buyListDelete", method = RequestMethod.GET)
	 public String buyListDelete(@RequestParam String seq) {
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		Buy buy = buydao.buySelectOne(seq);
		if(Integer.parseInt(buy.getMm())<10) {
			String mm = String.format("%02d", buy.getMm());
			buy.setMm(mm);
		}
		buy.setColumnname("buy"+buy.getMm());
		productdao.buyDeleteSub(buy);
		buy.setDealname("deal"+buy.getMm());
		buy.setBalancename("balance"+buy.getMm());
		buydao.buyDeleteBalance(buy);
		buydao.deleteRow(seq);
		return "redirect:productBuyForm";
	}
	@RequestMapping(value = "buySearch", method = RequestMethod.POST)
	 public ModelAndView buySearch(@ModelAttribute("buysearch")BuySearch buysearch) {
		ModelAndView mav = new ModelAndView("product/product_buy");
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		VenderDAO venderdao=sqlSession.getMapper(VenderDAO.class);
		ArrayList<Buy> buys =  buydao.SelectBuySearchRollup(buysearch);
		ArrayList<Vender> vender =venderdao.venderSelectBuyListAll();
		ArrayList<Product> product =productdao.selectListAll();
		mav.addObject("venders",vender);
		mav.addObject("products",product);
		mav.addObject("buys",buys);
		return mav;
	}
	@RequestMapping(value = "buyDetail", method = RequestMethod.POST)
	@ResponseBody
	 public Buy buyDetail(@RequestParam String seq) {
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		Buy buy = buydao.buySelectOne(seq);
		return buy;
	}
	@RequestMapping(value = "buyUpdate", method = RequestMethod.POST)
	 public ModelAndView buyUpdate(@ModelAttribute("buy")Buy buy) {
		ModelAndView mav = new ModelAndView("product/product_buy");
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		VenderDAO venderdao=sqlSession.getMapper(VenderDAO.class);
		buy.setColumnname("buy"+buy.getMm());
		buydao.updateRow(buy);
		productdao.buyUpdateSub(buy);
		productdao.buyProductAdd(buy);
		buy.setDealname("deal"+buy.getMm());
		buy.setBalancename("balance"+buy.getMm());
		buydao.buyUpdateBalance(buy);
		buydao.buyBalanceAdd(buy);
		ArrayList<Vender> vender =venderdao.venderSelectBuyListAll();
		ArrayList<Product> product =productdao.selectListAll();
		ArrayList<Buy> buys = buydao.buySelectListAll(buy);
		mav.addObject("venders",vender);
		mav.addObject("products",product);
		mav.addObject("buys",buys);
		return mav;
	}
	@RequestMapping(value = "buyStatement", method = RequestMethod.GET)
	 public ModelAndView buyStatement() {
		ModelAndView mav = new ModelAndView("product/product_buy_statement");
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		return mav;
	}
	@RequestMapping(value = "buyStatementMm", method = RequestMethod.POST)
	 public ModelAndView buyStatementMm(@RequestParam String yyyy , @RequestParam String mm) {
		ModelAndView mav = new ModelAndView("product/product_buy_statement_list");
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		HashMap yyyymm = new HashMap();
		yyyymm.put("yyyy", yyyy);
		yyyymm.put("mm", mm);
		ArrayList<Buy>buys=buydao.SelectBuyStatementMm(yyyymm);
		mav.addObject("buys",buys);
		mav.addObject("yyyy",yyyy);
		mav.addObject("mm",mm);
		return mav;
	}
	@RequestMapping(value = "buyStatementDd", method = RequestMethod.POST)
	 public ModelAndView buyStatementDd(@ModelAttribute("buy")Buy buy) {
		ModelAndView mav = new ModelAndView("product/product_buy_statement_list");
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		ArrayList<Buy>buys=buydao.SelectBuyStatementDd(buy);
		mav.addObject("buys",buys);
		mav.addObject("yyyy",buy.getYyyy());
		mav.addObject("mm",buy.getMm());
		mav.addObject("dd",buy.getDd());
		return mav;
	}
	
	
}
