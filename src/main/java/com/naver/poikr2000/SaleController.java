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

import com.naver.poikr2000.entities.BuySearch;
import com.naver.poikr2000.entities.Product;
import com.naver.poikr2000.entities.Sale;
import com.naver.poikr2000.entities.Vender;
import com.naver.poikr2000.service.BuyDAO;
import com.naver.poikr2000.service.ProductDAO;
import com.naver.poikr2000.service.SaleDAO;
import com.naver.poikr2000.service.VenderDAO;

@Controller
public class SaleController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Product product;
	@Autowired
	Vender vender;
	@Autowired
	Sale sale;
	
	@RequestMapping(value = "productSaleForm", method = RequestMethod.GET)
	 public ModelAndView productSaleForm() {
		BuyDAO buydao=sqlSession.getMapper(BuyDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		VenderDAO venderdao=sqlSession.getMapper(VenderDAO.class);
		ModelAndView mav = new ModelAndView("product/product_sale");
		ArrayList<Vender> venders =venderdao.venderSelectSaleListAll();
		ArrayList<Product> products =productdao.selectListAll();
		mav.addObject("venders",venders);
		mav.addObject("products",products);
		return mav;
	}
	@RequestMapping(value = "saleStatement", method = RequestMethod.GET)
	 public ModelAndView saleStatement() {
		ModelAndView mav = new ModelAndView("product/product_sale_statement");
		return mav;
	}
	@RequestMapping(value = "saleInsert", method = RequestMethod.POST)
	 public ModelAndView saleInsert(@ModelAttribute("sale")Sale sale) {
		SaleDAO saledao=sqlSession.getMapper(SaleDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		VenderDAO venderdao=sqlSession.getMapper(VenderDAO.class);
		try {
			saledao.insertRow(sale);
			sale.setColumnname("sale"+sale.getMm());
			productdao.saleProductAdd(sale);
			sale.setDealname("deal"+sale.getMm());
			sale.setBalancename("balance"+sale.getMm());
			saledao.saleBalanceAdd(sale);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		ArrayList<Vender> vender =venderdao.venderSelectSaleListAll();
		ArrayList<Product> product =productdao.selectListAll();
		
		sale.setHang(sale.getHang()+1);
		ModelAndView mav = new ModelAndView("product/product_sale");
		mav.addObject("venders",vender);
		mav.addObject("products",product);
		mav.addObject("sale",sale);
		ArrayList<Sale> sales = saledao.saleSelectListAll(sale);
		mav.addObject("sales",sales);
		
		return mav;
	}
	@RequestMapping(value = "saleNew", method = RequestMethod.POST)
	@ResponseBody
	 public Sale buyNew(@RequestParam String vendcode) {
		SaleDAO saledao=sqlSession.getMapper(SaleDAO.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		String yyyy= date.substring(0,4);
		String mm = date.substring(5,7);
		String dd = date.substring(8,10);
		sale.setYyyy(yyyy);
		sale.setMm(mm);
		sale.setDd(dd);
		sale.setVendcode(vendcode);
		int no = saledao.selectSequenceNo(sale);
		sale.setNo(no);
		sale.setHang(1);
		return sale;
	}
	@RequestMapping(value = "saleSearch", method = RequestMethod.POST)
	 public ModelAndView saleSearch(@ModelAttribute("buysearch")BuySearch buysearch) {
		ModelAndView mav = new ModelAndView("product/product_sale");
		SaleDAO saledao=sqlSession.getMapper(SaleDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		VenderDAO venderdao=sqlSession.getMapper(VenderDAO.class);
		ArrayList<Sale> sales =  saledao.SelectSaleSearchRollup(buysearch);
		ArrayList<Vender> vender =venderdao.venderSelectSaleListAll();
		ArrayList<Product> product =productdao.selectListAll();
		mav.addObject("venders",vender);
		mav.addObject("products",product);
		mav.addObject("sales",sales);
		return mav;
	}
	@RequestMapping(value = "saleDetail", method = RequestMethod.POST)
	@ResponseBody
	 public Sale saleDetail(@RequestParam String seq) {
		SaleDAO saledao=sqlSession.getMapper(SaleDAO.class);
		Sale sale = saledao.saleSelectOne(seq);
		return sale;
	}
	@RequestMapping(value = "saleListDelete", method = RequestMethod.GET)
	 public String saleListDelete(@RequestParam String seq) {
		SaleDAO saledao=sqlSession.getMapper(SaleDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		Sale sale = saledao.saleSelectOne(seq);
		if(Integer.parseInt(sale.getMm())<10) {
			String mm = String.format("%02d", sale.getMm());
			sale.setMm(mm);
		}
		sale.setColumnname("sale"+sale.getMm());
		productdao.saleDeleteSub(sale);
		sale.setDealname("deal"+sale.getMm());
		sale.setBalancename("balance"+sale.getMm());
		saledao.saleDeleteBalance(sale);
		saledao.deleteRow(seq);
		return "redirect:productSaleForm";
	}
	@RequestMapping(value = "saleUpdate", method = RequestMethod.POST)
	 public ModelAndView saleUpdate(@ModelAttribute("sale")Sale sale) {
		ModelAndView mav = new ModelAndView("product/product_sale");
		SaleDAO saledao=sqlSession.getMapper(SaleDAO.class);
		ProductDAO productdao=sqlSession.getMapper(ProductDAO.class);
		VenderDAO venderdao=sqlSession.getMapper(VenderDAO.class);
		sale.setColumnname("sale"+sale.getMm());
		saledao.updateRow(sale);
		productdao.saleUpdateSub(sale);
		productdao.saleProductAdd(sale);
		sale.setDealname("deal"+sale.getMm());
		sale.setBalancename("balance"+sale.getMm());
		saledao.saleUpdateBalance(sale);
		saledao.saleBalanceAdd(sale);
		ArrayList<Vender> vender =venderdao.venderSelectBuyListAll();
		ArrayList<Product> product =productdao.selectListAll();
		ArrayList<Sale> sales = saledao.saleSelectListAll(sale);
		mav.addObject("venders",vender);
		mav.addObject("products",product);
		mav.addObject("sales",sales);
		return mav;
	}
	@RequestMapping(value = "saleStatementMm", method = RequestMethod.POST)
	 public ModelAndView saleStatementMm(@RequestParam String yyyy , @RequestParam String mm) {
		ModelAndView mav = new ModelAndView("product/product_sale_statement_list");
		SaleDAO saledao=sqlSession.getMapper(SaleDAO.class);
		HashMap yyyymm = new HashMap();
		yyyymm.put("yyyy", yyyy);
		yyyymm.put("mm", mm);
		ArrayList<Sale>sales=saledao.SelectSaleStatementMm(yyyymm);
		mav.addObject("sales",sales);
		mav.addObject("yyyy",yyyy);
		mav.addObject("mm",mm);
		return mav;
	}
	@RequestMapping(value = "saleStatementDd", method = RequestMethod.POST)
	 public ModelAndView saleStatementDd(@ModelAttribute("sale")Sale sale) {
		ModelAndView mav = new ModelAndView("product/product_sale_statement_list");
		SaleDAO saledao=sqlSession.getMapper(SaleDAO.class);
		ArrayList<Sale>sales=saledao.SelectSaleStatementDd(sale);
		mav.addObject("sales",sales);
		mav.addObject("yyyy",sale.getYyyy());
		mav.addObject("mm",sale.getMm());
		mav.addObject("dd",sale.getDd());
		return mav;
	}
}
