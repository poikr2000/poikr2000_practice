package com.naver.poikr2000.service;

import java.util.ArrayList;

import com.naver.poikr2000.entities.Vender;

public interface VenderDAO {
	int venderConfirm(String code);
	int venderInsertRow (Vender vender);
	ArrayList<Vender> venderSelectBuyListAll();
	ArrayList<Vender> venderSelectSaleListAll();
	ArrayList<Vender> venderSelectListAll();
	int venderDeleteRow(String code);
	Vender venderSelectOne(String code);
	int venderUpdateRow (Vender vender);
}
