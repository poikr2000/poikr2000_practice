package com.naver.poikr2000.entities;

import org.springframework.stereotype.Component;

@Component
public class Member {
	private String email;
	private String password;
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	private String photo;
	private String beforephoto;
	private String beforepassword;
	private int memlevel;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getBeforephoto() {
		return beforephoto;
	}
	public void setBeforephoto(String beforephoto) {
		this.beforephoto = beforephoto;
	}
	public String getBeforepassword() {
		return beforepassword;
	}
	public void setBeforepassword(String beforepassword) {
		this.beforepassword = beforepassword;
	}
	public int getMemlevel() {
		return memlevel;
	}
	public void setMemlevel(int memlevel) {
		this.memlevel = memlevel;
	}
	
}
