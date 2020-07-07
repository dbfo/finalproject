package com.jhta.finalproject.yj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.yj.service.BooksService;
import com.jhta.finalproject.yj.vo.BooksVO;

@Controller
public class BooksListController {
	@Autowired
	private BooksService service;

	@RequestMapping("/booksList")
	public ModelAndView showList() {
		ModelAndView mv = new ModelAndView();
		List<BooksVO> list = service.list();
		mv.addObject("list", list);
		mv.setViewName(".booksList");
		return mv;
	}
}
