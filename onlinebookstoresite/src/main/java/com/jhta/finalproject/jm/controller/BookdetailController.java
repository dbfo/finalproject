package com.jhta.finalproject.jm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.jm.service.BookdetailService;
import com.jhta.finalproject.jm.service.BooksService;

@Controller
public class BookdetailController {
	@Autowired
	private BookdetailService service;

	@RequestMapping(value = "/bdetail", method = RequestMethod.GET)
	public String detailtest(int bnum,Model model) {
		service.addHit(bnum);
		
		
		return ".bdetail";
	}
}

