package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
@Getter @Setter
public class Product {
	private String code;
	private String name;
	private String capacity;
	private int buyprice;
	private int saleprice;
	private int preyystock;
	private int premmstock;
	private int preddstock;
	private int buy01;
	private int buy02;
	private int buy03;
	private int buy04;
	private int buy05;
	private int buy06;
	private int buy07;
	private int buy08;
	private int buy09;
	private int buy10;
	private int buy11;
	private int buy12;
	private int sale01;
	private int sale02;
	private int sale03;
	private int sale04;
	private int sale05;
	private int sale06;
	private int sale07;
	private int sale08;
	private int sale09;
	private int sale10;
	private int sale11;
	private int sale12;
	private int stock;
	private String explanation;
}
