package com.jhta.finalproject.jh.controller;

import java.util.HashMap;

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
		int snum=1;//나중에 세션에서 판매자번호 얻어오기
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map1.put("snum", snum);
		map1.put("obsalestatus",1);
		HashMap<String, Object> map2=new HashMap<String, Object>();
		map2.put("snum", snum);
		map2.put("obsalestatus",2);
		HashMap<String, Object> map3=new HashMap<String, Object>();
		map3.put("snum", snum);
		map3.put("obsalestatus",3);
		
		//판매현황
		//최근 한달간 상품 등록
		model.addAttribute("getOldbookCount", service.getOldbookCount(snum));
		//최근 한달간 판매현황(1:입금대기중 , 2:입금완료/배송요청,  3: 판매완료/구매확정) 
		model.addAttribute("getOldbookSalestatusCount1", service.getOldbookSalestatusCount(map1));
		model.addAttribute("getOldbookSalestatusCount2", service.getOldbookSalestatusCount(map2));
		model.addAttribute("getOldbookSalestatusCount3", service.getOldbookSalestatusCount(map3));
		
		
		
		return ".seller";
	}
}
