package com.naver.poikr2000.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.poikr2000.entities.Buy;
import com.naver.poikr2000.entities.BuySearch;

public interface BuyDAO {
	int buyInsertRow(Buy buy);
	ArrayList<Buy> buySelectListAll(Buy buy);
	int selectSequenceNo(Buy buy);
	int deleteRow(String seq);
	Buy buySelectOne(String seq);
	ArrayList<Buy> SelectBuySearchRollup(BuySearch buysearch);
	int updateRow(Buy buy);
	void buyBalanceAdd(Buy buy);
	int buyDeleteBalance(Buy buy);
	int buyUpdateBalance(Buy buy);
	ArrayList<Buy> SelectBuyStatementMm(HashMap yyyymm);
	ArrayList<Buy> SelectBuyStatementDd(Buy buy);
}
