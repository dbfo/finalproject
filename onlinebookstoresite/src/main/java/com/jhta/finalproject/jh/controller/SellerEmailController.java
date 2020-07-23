package com.jhta.finalproject.jh.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.xml.soap.MimeHeader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.jh.email.MailHandler;

@Controller
public class SellerEmailController {
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/seller/mail")
	public String sellerMail(String email1,HttpServletRequest req) {
		System.out.println("전달받은 이메일:"+email1);
		String setform="dkswlgh95@gmail.com";
		String tomail=email1;//받는사람
		String title="테스트용";
		String content="테스트내용";
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
		return "/";
	}
}
