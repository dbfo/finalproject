package com.jhta.finalproject.yj.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.yj.service.BooksService;
import com.jhta.finalproject.yj.vo.BigCategoryVO;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;
import com.jhta.finalproject.yj.vo.SmallCategoryVO;

@Controller
public class BooksInsertController {
	@Autowired
	private BooksService service;

	@GetMapping("/booksInsert")
	public String booksInsert(Model model) {
		List<BigCategoryVO> getBigctg = service.getBigctg();
//		List<SmallCategoryVO> getSmallctg = service.getSmallctg(bcatenum);
		model.addAttribute("getBigctg", getBigctg);
//		model.addAttribute("getSmallctg", getSmallctg);
		return ".booksInsert";
	}

	@PostMapping("/booksInsert")
	public String insertOk(BooksVO bvo) {
		try {
			service.booksInsert(bvo);
			return ".ok";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return ".no";
		}
	}
}
