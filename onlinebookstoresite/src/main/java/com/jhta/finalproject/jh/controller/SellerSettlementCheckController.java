package com.jhta.finalproject.jh.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.jh.service.SellerSettlmentService;
import com.jhta.finalproject.jh.vo.SellerFeepayJoinVo;
import com.jhta.page.util.PageUtil;
@Controller
public class SellerSettlementCheckController {
	@Autowired
	private SellerSettlmentService service;
	
	
	@RequestMapping("/seller/settlementCheck")
	public String settlementCheckList(
			Model model,HttpSession session,
			String bocomstatus,
			@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String feedate,String startDay,String endDay
			) {
		int snum=(Integer)session.getAttribute("snum");
//		int snum=1;//중고판매자번호 나중에 세션에서 얻어옴@@@@@@@@@
		HashMap<String, Object> map=new HashMap<String, Object>();
		System.out.println("페이지넘:"+pageNum);
		map.put("snum",snum);
		map.put("bocomstatus",bocomstatus); //정산상태
		map.put("feedate",feedate);
		map.put("startDay",startDay);  
		map.put("endDay",endDay);
		int totalRowCount=service.getTotRowCount(map);//전체행갯수
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 3);//페이징
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		System.out.println("startRow:"+pu.getStartRow());
		System.out.println("endRow:"+pu.getEndRow());
		List<SellerFeepayJoinVo> list=service.getSettlementList(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("map", map);
		return ".seller.settlementCheck";
	}
}
