package com.naver.poikr2000;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.poikr2000.entities.Board;
import com.naver.poikr2000.entities.BoardPaging;
import com.naver.poikr2000.entities.Member;
import com.naver.poikr2000.service.BoardDAO;
import com.naver.poikr2000.service.MemberDAO;

@Controller
public class BoardController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Board board;
	@Autowired
	BoardPaging boardpaging;
	@RequestMapping(value = "board_insert", method = RequestMethod.GET)
	public ModelAndView board_insert(HttpSession session) {
		ModelAndView mav = new ModelAndView("board/board_insert");
		System.out.println(session.getAttribute("sessionname"));
		if(session.getAttribute("sessionname")!=null){
			String email = session.getAttribute("sessionemail").toString();
			MemberDAO dao=null;
			dao=sqlSession.getMapper(MemberDAO.class);
			Member member = dao.memberGetOne(email);
			mav.addObject("member",member);
		}
		return mav;
	}
	@RequestMapping(value = "boardInsert", method = RequestMethod.POST)
	public ModelAndView boardInsert(@ModelAttribute("board") Board board,
			HttpServletRequest request,
			@RequestParam CommonsMultipartFile file) {
		ModelAndView mav = new ModelAndView("board/b_result");
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		if(!file.getOriginalFilename().equals("")) {
			String filetime=System.currentTimeMillis()+"";
			String path="D:/STSSOURCE/ncs3project/src/main/webapp/resources/uploadattachs/";
			String realpath="resources/uploadattachs/";
			String originalname =file.getOriginalFilename();
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+filetime+originalname));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
			}
			board.setB_attach(realpath+filetime+originalname);
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy년  MM월 dd일 hh시 mm:ss");
		Date date=new Date();
		String today=df.format(date);
		board.setB_date(today);
		String ip = request.getRemoteAddr();
		board.setB_ip(ip);
		int result =0;
		String message = "저장되었습니다.";
		try {
			result=dao.insertRow(board);
		}catch (Exception e) {
			message=e.getMessage();
		}
		mav.addObject("msg", message);
		return mav;
	}
	@RequestMapping(value = "boardPageList", method = RequestMethod.GET)
	public ModelAndView boardPageList(HttpSession session,@RequestParam String find) {
		ModelAndView mav = new ModelAndView("board/board_page_list");
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		int pageSize = 10;
		
		int startrow = (1-1)*pageSize;
		int endrow = 10;
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		boardpaging.setFind(find);
		ArrayList<Board> boards = dao.selectPageList(boardpaging);
		
		int rowCount = dao.selectPageCount(boardpaging);
		int absPage =1;
		if(rowCount%pageSize==0) {
			absPage=0;
		}
		int pageCount = rowCount / pageSize +absPage;
		
		int pages[] = new int[pageCount];
		for(int i=0;i<pageCount;i++) {
			pages[i]=i+1;
		}
		
		mav.addObject("boards",boards);
		mav.addObject("pages",pages);
		mav.addObject("find",find);
		return mav;
	}
	@RequestMapping(value = "boardPageSelect", method = RequestMethod.GET)
	public ModelAndView boardPageSelect(@RequestParam String page,@RequestParam String find) {
		ModelAndView mav = new ModelAndView("board/board_page_list");
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		int pageSize = 10;
		int startrow = (Integer.parseInt(page)-1)*pageSize;
		int endrow = 10;
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		boardpaging.setFind(find);
		ArrayList<Board> boards = dao.selectPageList(boardpaging);

		int rowCount = dao.selectPageCount(boardpaging);
		int absPage =1;
		if(rowCount%pageSize==0) {
			absPage=0;
		}
		int pageCount = rowCount / pageSize +absPage;
		
		int pages[] = new int[pageCount];
		for(int i=0;i<pageCount;i++) {
			pages[i]=i+1;
		}
		mav.addObject("boards",boards);
		mav.addObject("pages",pages);
		mav.addObject("find",find);
		return mav;
	}
	
	
	@RequestMapping(value = "boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(HttpSession session,@RequestParam int b_seq,@RequestParam String b_email) {
		ModelAndView mav = new ModelAndView("board/board_detail");
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		board=dao.selectDetail(b_seq);
		if(!b_email.equals(session.getAttribute("sessionemail"))) {
			dao.updateHit(b_seq);
		}
		mav.addObject(board);
		return mav;
	}
	@RequestMapping(value = "boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute("board") Board board,RedirectAttributes redirectAttributes,
			HttpServletRequest request,@RequestParam CommonsMultipartFile file) {
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy년  MM월 dd일 hh시 mm:ss");
		Date date=new Date();
		String today=df.format(date);
		board.setB_date(today);
		String ip = request.getRemoteAddr();
		board.setB_ip(ip);
		String filetime=System.currentTimeMillis()+"";
		String path="D:/STSSOURCE/ncs3project/src/main/webapp/resources/uploadattachs/";
		String realpath="resources/uploadattachs/";
		String originalname =file.getOriginalFilename();
		if(!file.getOriginalFilename().equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+filetime+originalname));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
			}
			board.setB_attach(realpath+filetime+originalname);
		}
		try {
			dao.boardUpdate(board);
		}catch (Exception e) {
		}
		redirectAttributes.addAttribute("find","");
		return "redirect:boardPageList";
	}
	@RequestMapping(value = "boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam int b_seq,RedirectAttributes redirectAttributes) {
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		dao.deleteRow(b_seq);
		redirectAttributes.addAttribute("find","");
		return "redirect:boardPageList";
	}
	@RequestMapping(value = "boardDownload", method = RequestMethod.GET)
	 public ModelAndView boardDownload(@RequestParam String b_attach) {
	  File file = new File(b_attach); 
	  String path = "D:/STSSOURCE/ncs3project/src/main/webapp/resources/uploadattachs/";
	  String originalname =file.getName();
	  File realfile = new File(path+originalname);
	  return new ModelAndView("download","downloadFile",realfile);
	 }
	@RequestMapping(value = "boardReplyForm", method = RequestMethod.GET)
	 public ModelAndView boardReplyForm(@RequestParam int b_seq) {
		ModelAndView mav = new ModelAndView("board/board_reply");
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		Board board=dao.selectDetail(b_seq);
		mav.addObject("board",board);
		return mav;
	 }
	@RequestMapping(value = "boardReplyInsert", method = RequestMethod.POST)
	public String boardReplyInsert(@ModelAttribute("board") Board board,RedirectAttributes redirectAttributes,
			HttpServletRequest request,@RequestParam CommonsMultipartFile file) {
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy년  MM월 dd일 hh시 mm:ss");
		Date date=new Date();
		String today=df.format(date);
		board.setB_date(today);
		String ip = request.getRemoteAddr();
		board.setB_ip(ip);
		String filetime=System.currentTimeMillis()+"";
		String path="D:/STSSOURCE/ncs3project/src/main/webapp/resources/uploadattachs/";
		String realpath="resources/uploadattachs/";
		String originalname =file.getOriginalFilename();
		if(!file.getOriginalFilename().equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+filetime+originalname));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
			}
			board.setB_attach(realpath+filetime+originalname);
		}
		try {
			dao.insertReplyRow(board);
		}catch (Exception e) {
		}
		redirectAttributes.addAttribute("find","");
		return "redirect:boardDatatable";
	}
	@RequestMapping(value = "boardDatatable", method = RequestMethod.GET)
	 public ModelAndView boardDatatable() {
		ModelAndView mav = new ModelAndView("board/board_datatable");
		BoardDAO dao=null;
		dao=sqlSession.getMapper(BoardDAO.class);
		ArrayList<Board> boards = dao.selectPageListAll();
		mav.addObject("boards",boards);
		return mav;
	 }
}
