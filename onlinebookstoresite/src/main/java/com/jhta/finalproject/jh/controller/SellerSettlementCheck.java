package com.jhta.finalproject.jh.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.jh.service.SellerSettlmentService;
import com.jhta.finalproject.jh.vo.SellerFeepayJoinVo;
import com.jhta.page.util.PageUtil;
@Controller
public class SellerSettlementCheck {
	@Autowired
	private SellerSettlmentService service;
	
	
	@RequestMapping("/seller/settlementCheck")
	public String settlementCheckList(
			Model model,
			@RequestParam(value="bocomstatus", defaultValue = "0")int bocomstatus,
			@RequestParam(value="pageNum",defaultValue = "1")int pageNum
			) {
		int snum=1;//중고판매자번호 나중에 세션에서 얻어옴@@@@@@@@@
		System.out.println("상태:"+bocomstatus);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("snum",snum);
		map.put("bocomstatus",bocomstatus); //정산상태
		int totalRowCount=service.getTotRowCount(map);//전체행갯수
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 3);//페이징
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<SellerFeepayJoinVo> list=service.getSettlementList(map);
		System.out.println("리스트:"+list.size());
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return ".seller.settlementCheck";
	}
}
