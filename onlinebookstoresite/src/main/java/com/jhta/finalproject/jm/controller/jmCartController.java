package com.jhta.finalproject.jm.controller;

import javax.naming.PartialResultException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jm.service.jmCartService;
import com.jhta.finalproject.jm.vo.CartVo;

@Controller
public class jmCartController {
	@Autowired private jmCartService cart_service;
	
	@PostMapping("/cart/insert")
	@ResponseBody
	public String insertCart(HttpSession session, int bnum, int bcount) {
		String smnum=(String)session.getAttribute("mnum");
		CartVo vo=new CartVo();
		vo.setBnum(bnum);
		vo.setBcount(bcount);
		int mnum=Integer.parseInt(smnum);
		vo.setMnum(mnum);
		int n=cart_service.cartinsert(vo);
		if(n>0) {
			return "success";
		}else {
			return "fail";
		}
	}

//	@PostMapping("/cart/obinsert")
//	@ResponseBody
//	public String obinsertCart(HttpSession session, int obnum, int obcount) {
//		String smnum=(String)session.getAttribute("mnum");
//		CartVo vo=new CartVo();
//		vo.setBnum(obnum);
//		vo.setBcount(obcount);
//		int mnum=Integer.parseInt(smnum);
//		vo.setMnum(mnum);
//		int n=cart_service.cartinsert(vo);
//		if(n>0) {
//			return "success";
//		}else {
//			return "fail";
//		}
//	}
}
