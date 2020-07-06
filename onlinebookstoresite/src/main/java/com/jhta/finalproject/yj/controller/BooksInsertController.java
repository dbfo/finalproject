package com.jhta.finalproject.yj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.finalproject.yj.service.BooksService;
import com.jhta.finalproject.yj.vo.BooksVO;

@Controller
public class BooksInsertController {
	@Autowired
	private BooksService service;

	@GetMapping("/booksInsert")
	public String booksInsert() {
		return ".booksInsert";
	}

	@PostMapping("/booksInsert")
	public String insertOk(BooksVO vo) {
		try {
			service.booksInsert(vo);
			return ".ok";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return ".no";
		}
	}
}
