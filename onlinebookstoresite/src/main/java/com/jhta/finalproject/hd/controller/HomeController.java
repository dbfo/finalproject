package com.jhta.finalproject.hd.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.hd.service.HomeService;

/**
 * 홈에서 보내줘야하는것.
 * 베스트셀러 리스트 / 신간 리스트/ 회원아이디 / 장바구니 리스트.
 */
@Controller
public class HomeController { 
	@Autowired
	private HomeService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,HttpServletRequest req) {
		session.setAttribute("cp", req.getContextPath());
		return ".main";
	}
	
}
