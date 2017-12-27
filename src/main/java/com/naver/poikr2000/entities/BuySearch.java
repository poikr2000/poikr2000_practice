package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
@Getter @Setter
public class BuySearch {
	private String searchvender;
	private String searchyyyy;
	private String searchmm;
	private String searchdd;
}
