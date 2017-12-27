package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
@Getter @Setter
public class Sale {
	private int seq;
	private String vendcode;
	private String vendname;
	private String yyyy;
	private String mm;
	private String dd;
	private int no;
	private int hang;
	private String procode;
	private String beforeprocode;
	private String proname;
	private int price;
	private int qty;
	private int beforeqty;
	private String memo;
	private String columnname;
	private int total;
	private String dealname;
	private String balancename;
}
