package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
@Getter @Setter
public class Board {
	private int b_seq;
	private String b_email;
	private String b_name;
	private String b_password;
	private String b_title;
	private String b_content;
	private String b_ip;
	private int b_ref;
	private int b_step;
	private int b_hit;
	private int b_level;
	private String b_attach;
	private String b_date;
}
