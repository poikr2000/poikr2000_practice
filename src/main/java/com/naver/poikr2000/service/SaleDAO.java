package com.naver.poikr2000.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.poikr2000.entities.BuySearch;
import com.naver.poikr2000.entities.Sale;

public interface SaleDAO {
	int insertRow(Sale sale);
	int updateRow(Sale sale);
	int saleBalanceAdd(Sale sale);
	ArrayList<Sale> saleSelectListAll(Sale sale);
	ArrayList<Sale> SelectSaleSearchRollup(BuySearch buysearch);
	Sale saleSelectOne(String seq);
	int deleteRow(String seq);
	int saleDeleteBalance(Sale sale);
	int saleUpdateBalance(Sale sale);
	ArrayList<Sale> SelectSaleStatementMm(HashMap yyyymm);
	ArrayList<Sale> SelectSaleStatementDd(Sale sale);
	int selectSequenceNo(Sale sale);
}
