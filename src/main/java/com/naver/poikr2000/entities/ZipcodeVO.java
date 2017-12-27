package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
@Getter @Setter
public class ZipcodeVO {
	private String address;     // 지번주소
    private String lnmAddress;  // 도로명주소
    private String zipcode;     // 우편번호
}
