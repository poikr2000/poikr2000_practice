package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
@Getter @Setter
public class ZipcodeSearchTO {
	 private String target;
	 private String query;
}
