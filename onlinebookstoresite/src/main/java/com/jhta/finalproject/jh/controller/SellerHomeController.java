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
		//판매현황
		//최근 한달간 상품 등록
		model.addAttribute("getOldbookCount", service.getOldbookCount());
		//최근 한달간 판매현황(1:입금대기중 , 2:입금완료/배송요청,  3: 판매완료/구매확정) 
		model.addAttribute("getOldbookSalestatusCount1", service.getOldbookSalestatusCount(1));
		model.addAttribute("getOldbookSalestatusCount2", service.getOldbookSalestatusCount(2));
		model.addAttribute("getOldbookSalestatusCount3", service.getOldbookSalestatusCount(3));
		
		
		
		return ".seller";
	}
}
