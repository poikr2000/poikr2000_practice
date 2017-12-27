package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
@Getter @Setter
public class Vender {
	private String code;
	private String name;
	private String busno1;
	private String busno2;
	private String busno3;
	private String ceoname;
	private String zipcode;
	private String newaddr;
	private String oldaddr;
	private String detailaddr;
	private String officeno1;
	private String officeno2;
	private String officeno3;
}
