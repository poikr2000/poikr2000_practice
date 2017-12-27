package com.naver.poikr2000;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.poikr2000.entities.Board;
import com.naver.poikr2000.entities.Member;
import com.naver.poikr2000.service.MemberDAO;
import com.naver.poikr2000.service.SalaryDAO;

@Controller
public class LoginController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Member data;
	@Autowired
	Board board;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//njeqqtavfwngbzwc gmail인증키
	
	@RequestMapping(value = "passwordFind", method = RequestMethod.POST)
	@ResponseBody
	public int passwordFind(@RequestParam String email,@RequestParam String name) {
		data.setEmail(email);
		data.setName(name);
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		Member member=null;
		try {
			member=dao.passwordFind(data);
		}catch(Exception e) {
			System.out.println("error : "+e.getMessage());
		}
		if(member==null) {
			return 0;
		}else {
			String temppass = randomNum();
			sendEmail(email, temppass);
			data.setPassword(temppass);
			dao.passwordChange(data);
			return 1;
		}
	}
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "login/login";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String result(@ModelAttribute("member") Member member,HttpSession session) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		Member data = dao.memberGetOne(member.getEmail());
		if(data==null) {
			return "login/login_fail";
		}else {
			if(BCrypt.checkpw(member.getPassword(), data.getPassword())) {
                session.setAttribute("sessionemail", data.getEmail());
    			session.setAttribute("sessionname", data.getName());
    			session.setAttribute("sessionphoto", data.getPhoto());
    			session.setAttribute("sessionpassword", data.getPassword());
    			session.setAttribute("sessionlevel", data.getMemlevel());
    			return "redirect:index";
	        }else {
	            return "login/login_fail";
	        }
		}
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index";
	}
	@RequestMapping(value = "confirm", method = RequestMethod.POST)
	@ResponseBody
	public int confirm(@RequestParam String email) {
		SalaryDAO dao=sqlSession.getMapper(SalaryDAO.class);
		int result = 0;
		try {
		}catch(Exception e) {
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "member_insert", method = RequestMethod.GET)
	public String login1() {
		
		return "member/member_insert";
	}
	@RequestMapping(value = "memberInsert", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member,
			@RequestParam CommonsMultipartFile imgfile) {
		String path="D:/STSSOURCE/ncs3project/src/main/webapp/resources/uploadfiles/";
		String realpath="resources/uploadfiles/";
		String originalname =imgfile.getOriginalFilename();
		String stremail = member.getEmail();
		String cutemail = stremail.substring(0,stremail.indexOf("@"));
		try {
			byte bytes[] = imgfile.getBytes();
			BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+cutemail+originalname));
			output.write(bytes);
			output.flush();
			output.close();
		} catch (Exception e) {
			
		}
		MemberDAO dao=null;
		int result=0;
		dao=sqlSession.getMapper(MemberDAO.class);
		String message = "저장되었습니다.";
		try {
			member.setPhoto(realpath+cutemail+originalname);
			String encodepassword=passwordEncoder.encode(member.getPassword());
			if(passwordEncoder.matches(member.getPassword(),encodepassword)) {
                System.out.println("같음");
	        }else {
	            System.out.println("다름");
	        }
			member.setPassword(encodepassword);
			
			result=dao.memberInsert(member);
		}catch (Exception e) {
			message=e.getMessage();
		}
		
		ModelAndView mav = new ModelAndView("login/result");
		
		mav.addObject("msg", message);
		return mav;
	}
	@RequestMapping(value = "memberList", method = RequestMethod.GET)
	public ModelAndView memberList(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("member/member_list");
		MemberDAO dao=null;
		dao=sqlSession.getMapper(MemberDAO.class);
		ArrayList<Member> members = dao.memberListAll();
		mav.addObject("members",members);
		return mav;
	}
	@RequestMapping(value = "memberDetail", method = RequestMethod.GET)
	public ModelAndView memberDetail(@RequestParam String email) {
		ModelAndView mav = new ModelAndView("member/member_update");
		MemberDAO dao=null;
		dao=sqlSession.getMapper(MemberDAO.class);
		Member member = dao.memberGetOne(email);
		mav.addObject("member",member);
		return mav;
	}
	@RequestMapping(value = "memberDirectUpdate", method = RequestMethod.GET)
	public ModelAndView memberDirectUpdate(HttpSession session) {
		ModelAndView mav = new ModelAndView("member/member_update");
		String email = session.getAttribute("sessionemail").toString();
		MemberDAO dao=null;
		dao=sqlSession.getMapper(MemberDAO.class);
		Member member = dao.memberGetOne(email);
		mav.addObject("member",member);
		return mav;
	}
	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("member") Member member,
			@RequestParam CommonsMultipartFile imgfile) {
		String path="D:/STSSOURCE/ncs3project/src/main/webapp/resources/uploadfiles/";
		String realpath="resources/uploadfiles/";
		String originalname =imgfile.getOriginalFilename();
		String stremail = member.getEmail();
		String cutemail = stremail.substring(0,stremail.indexOf("@"));
		try {
			byte bytes[] = imgfile.getBytes();
			BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+cutemail+originalname));
			output.write(bytes);
			output.flush();
			output.close();
		} catch (Exception e) {
			
		}
		MemberDAO dao=null;
		int result=0;
		dao=sqlSession.getMapper(MemberDAO.class);
		String message = "수정되었습니다.";
		try {
			if(originalname.equals("")) {
				member.setPhoto(member.getBeforephoto());
			}else {
				member.setPhoto(realpath+cutemail+originalname);
			}
			if(!member.getBeforepassword().equals(member.getPassword())) {
				String encodepassword=passwordEncoder.encode(member.getPassword());
				member.setPassword(encodepassword);
			}
			result=dao.memberUpdate(member);
		}catch (Exception e) {
			message=e.getMessage();
		}
		
		ModelAndView mav = new ModelAndView("login/result");
		
		mav.addObject("msg", message);
		return mav;
	}

	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public ModelAndView memberDelete(@RequestParam String delemail) {
		int result=0;
		String message = null;
		ModelAndView mav = new ModelAndView("login/delete_result");
		MemberDAO dao=null;
		dao=sqlSession.getMapper(MemberDAO.class);
		result=dao.memberDelete(delemail);
		if(result>0) {
			message="삭제 되었습니다.";
		}else {
			message="삭제 되지 않았습니다.";
		}
		mav.addObject("msg", message);
		return mav;
	}
	String randomNum(){
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=5;i++){
			int num = (int) (Math.random()*10);
			buffer.append(num);
		}
		return buffer.toString();
	}
	private void sendEmail( String email, String authNum ) {
		  String host = "smtp.gmail.com";
		  String subject = "itschool 인증번호";
		  String fromName = "itschool 관리자";
		  String from = "poikr2017@gmail.com";
		  String to1 = email;
		  String content = "임시 비밀번호["+authNum+"]";
		  try {
			  Properties props = new Properties();
			  props.put("mail.smtp.starttls.enable", "true");
			  props.put("mail.transport.protocol", "smtp");
			  props.put("mail.smtp.host", host);
			  props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			  props.put("mail.smtp.port","587"); // or 465
			  props.put("mail.smtp.user",from);
			  props.put("mail.smtp.auth","true");
		   
			  Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() {
				  		protected PasswordAuthentication getPasswordAuthentication() {
				  			
				  			return new PasswordAuthentication("poikr2017", "njeqqtavfwngbzwc");    // 위 gmail에서 생성된 비밀번호 넣는다
				  		}
			  });
			  Message msg = new MimeMessage( mailSession);
			  msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));
			  
			  InternetAddress[] address1 = { new InternetAddress(to1)};
			  msg.setRecipients(Message.RecipientType.TO, address1);
			  msg.setSubject(subject);
			  msg.setSentDate(new java.util.Date());
			  msg.setContent(content,"text/html;charset=euc-kr");
			  Transport.send(msg);
			  System.out.println("----> success:");
		  }catch (Exception e) {
		   System.out.println("----> error:"+e.getMessage());
		  }
	}
}
