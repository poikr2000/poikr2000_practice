package com.naver.poikr2000.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.poikr2000.entities.Balance;
import com.naver.poikr2000.entities.Buy;
import com.naver.poikr2000.entities.Product;
import com.naver.poikr2000.entities.Sale;

public interface ProductDAO {
	int productConfirm(String code);
	int insertRow (Product product);
	int updateRow (Product product);
	int deleteRow(String code);
	ArrayList<Product> selectListAll();
	Product selectOne(String code);
	int buyProductAdd(Buy buy);
	int saleProductAdd(Sale sale);
	int buyDeleteSub(Buy buy);
	int saleDeleteSub(Sale sale);
	int buyUpdateSub(Buy buy);
	int saleUpdateSub(Sale sale);
	int mmTaskClose();
	int yearTaskClose();
	ArrayList<Balance> balanceListAll();
	void balanceMonthClose(HashMap closemap);
	void balanceYearClose(ArrayList<Balance>list);
	ArrayList<Balance> balanceYyyyList(HashMap yyyyclose);
	Balance BalanceSelectGenOne(HashMap detailmap);
	void balanceUpdate(Balance balance);
	
}
