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
		//판매현황
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map1.put("snum", snum);
		map1.put("bstatus",0);
		HashMap<String, Object> map2=new HashMap<String, Object>();
		map2.put("snum", snum);
		map2.put("bstatus",1);
		HashMap<String, Object> map3=new HashMap<String, Object>();
		map3.put("snum", snum);
		map3.put("bstatus",2);
		HashMap<String, Object> map4=new HashMap<String, Object>();
		map4.put("snum", snum);
		map4.put("bstatus",3);
		//정산현황
		HashMap<String, Object> map5=new HashMap<String, Object>();
		map5.put("snum", snum);
		map5.put("bocomstatus", 0);
		HashMap<String, Object> map6=new HashMap<String, Object>();
		map6.put("snum", snum);
		map6.put("bocomstatus", 1);
		
		//판매현황
		//최근 한달간 상품 등록
		model.addAttribute("getOldbookCount", service.getOldbookCount(snum));
		//최근 한달간 판매현황(0:주문/입금대기중,1:결제완료,2:배송중,3:수령완료(구매확정),4:환불) 
		model.addAttribute("getOldbookSalestatusCount1", service.getOldbookSalestatusCount(map1));
		model.addAttribute("getOldbookSalestatusCount2", service.getOldbookSalestatusCount(map2));
		model.addAttribute("getOldbookSalestatusCount3", service.getOldbookSalestatusCount(map3));
		model.addAttribute("getOldbookSalestatusCount4", service.getOldbookSalestatusCount(map4));
		//최근 한달간 정산현황(0:정산전,1:정산후)
		model.addAttribute("getObcompleteCount1", service.getObcompleteCount(map5));
		model.addAttribute("getObcompleteCount2", service.getObcompleteCount(map6));
		
		return ".seller";
	}
}
