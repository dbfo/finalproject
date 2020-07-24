package com.jhta.finalproject.jh.controller;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.jh.email.TempKey;
import com.jhta.finalproject.jh.service.SellerMainBoardService;

@Controller
public class SellerEmailController {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SellerMainBoardService service;
	
	//인증메일 발송하는 메소드
	@RequestMapping("/seller/mail")
	public String sellerMail(String email1,HttpServletRequest req,Model model) {
		System.out.println("전달받은 이메일:"+email1);
		TempKey tk=new TempKey();
		String code=tk.generateKey(5);
		System.out.println("인증코드:"+code);
		
		String setform="dkswlgh95@gmail.com";
		String tomail=email1;//받는사람
		String title="GoBook! 중고판매자 인증메일입니다.";
		String content="귀하의 인증번호는 ["+code+"]입니다.";
		try {
			MimeMessage message=mailSender.createMimeMessage();
			MimeMessageHelper messageHelper=new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setFrom(setform);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("code", code);
		return ".seller.emailInjeung";
	}
	
	//인증코드가 완료되면 중고판매자 번호 insert
	@RequestMapping("/seller/injeung")
	public String sellerInjeung(HttpSession session) {
		System.out.println("인증완료 컨트롤러");
		System.out.println("인증회원번호:"+session.getAttribute("mnum"));
		int mnum=Integer.parseInt((String)session.getAttribute("mnum"));
		service.sellerInsert(mnum);
		return ".seller";
	}
}
