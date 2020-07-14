package com.jhta.finalproject.jh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.jh.service.SellerMainBoardService;

@Controller
public class SellerHomeController {
	@Autowired
	private SellerMainBoardService service;
	//====================중고판매자 페이지이동==========================
	@RequestMapping(value = "/seller")
	public String sellerTest(Model model) {
		//최근 한달간 상품 등록
		model.addAttribute("getOldbookCount", service.getOldbookCount());
		return ".seller";
	}
}
