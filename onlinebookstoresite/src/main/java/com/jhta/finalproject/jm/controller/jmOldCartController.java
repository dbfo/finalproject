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
import com.jhta.finalproject.jm.service.jmOldCartService;
import com.jhta.finalproject.jm.vo.CartVo;
import com.jhta.finalproject.jm.vo.OldCartVo;

@Controller
public class jmOldCartController {
	@Autowired private jmOldCartService oldservice;
	
	
	@PostMapping("/cart/oldinsert")
	@ResponseBody
	public String oldinsertCart(HttpSession session, int obnum, int bcount) {
		String smnum=(String)session.getAttribute("mnum");
		System.out.println("smnum에 뭐들어있냐" + smnum);
		if(smnum == null) {
			smnum = "0";
		}
		OldCartVo vo=new OldCartVo(); 
		
		vo.setObnum(obnum);
		vo.setBcount(bcount);
		int mnum=Integer.parseInt(smnum);
		System.out.println("mnum에 뭐들어있냐" + mnum);
		if (mnum == 0) {
			return "fail";
		}
		vo.setMnum(mnum);
		int n=oldservice.oldcartinsert(vo);
		if(n>0) {
			return "success";
		}else {
			return "fail";
		}
	}

}
