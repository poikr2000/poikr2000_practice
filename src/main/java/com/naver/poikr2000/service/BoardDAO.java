package com.naver.poikr2000.service;

import java.util.ArrayList;

import com.naver.poikr2000.entities.Board;
import com.naver.poikr2000.entities.BoardPaging;

public interface BoardDAO {
	int insertRow(Board board);
	ArrayList<Board> selectPageListAll();
	ArrayList<Board> selectPageList(BoardPaging boardpaging);
	int selectPageCount(BoardPaging boardpaging);
	Board selectDetail(int b_seq);
	int deleteRow(int b_seq);
	int boardUpdate(Board board);
	void updateHit(int b_seq);
	int insertReplyRow(Board board);
}
