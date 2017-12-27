package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter @Setter
public class BoardPaging {
	private String find;
	private String selectbox;
	private int startrow;
	private int endrow;
}
