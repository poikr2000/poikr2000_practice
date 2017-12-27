package com.naver.poikr2000.service;

import java.util.ArrayList;

import com.naver.poikr2000.entities.Member;

public interface MemberDAO {
	int emailConfirm(String email);
	int memberInsert(Member member);
	ArrayList<Member> memberListAll();
	Member memberGetOne(String email);
	int memberUpdate(Member member);
	int memberDelete(String email);
	Member passwordFind(Member member);
	int passwordChange(Member member);
}
