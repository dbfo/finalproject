package com.jhta.finalproject.hd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Ȩ���� ��������ϴ°�.
 * ����Ʈ���� ����Ʈ / �Ű� ����Ʈ/ ȸ�����̵� / ��ٱ��� ����Ʈ.
 */
@Controller
public class HomeController { 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,HttpServletRequest req) {
		session.setAttribute("cp", req.getContextPath());
		session.setAttribute("id", "test01");
		session.setAttribute("mnum", "9999");
		return ".main";
	}
	
}
