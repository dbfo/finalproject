package com.jhta.finalproject.jh.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ctc.wstx.shaded.msv_core.datatype.xsd.TotalDigitsFacet;
import com.jhta.finalproject.jh.service.SellerSalesManagementService;
import com.jhta.finalproject.jh.vo.SellerSalesJoinVo;
import com.jhta.page.util.PageUtil;

@Controller
public class SellerSalesManageController {
	@Autowired
	private SellerSalesManagementService service;
	/*
bpayment bstatus
0:주문
1:결제완료
2:배송중
3:수령완료(구매확정)
4:환불
	 * */
	
	//판매관리 메소드(입금대기중)
	@RequestMapping("/seller/salesManagement")
	public String salesManage(
			Model model,
			@RequestParam(value="tabType",defaultValue = "1")int tabType,
			String keyword1,
			@RequestParam(value="borderdate1",defaultValue = "1")int borderdate1,
			String startDay,
			String endDay,
			String field1,
			@RequestParam(value="pageNum",defaultValue = "1")int pageNum) {
		
		int snum=1;//중고판매자번호 나중에 세션에서 얻어옴
		int bstatus=tabType-1; //주문,입금전
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		System.out.println("borderdate1:"+borderdate1);
		System.out.println("startDay:"+startDay);
		System.out.println("endDay:"+endDay);
		System.out.println("keyword1:"+keyword1);
		System.out.println("field1:"+field1);
		
		
		
		map.put("snum", snum);
		map.put("bstatus",bstatus);
		int totRowCount=service.getTotRowCount(map);
		
		
		
		System.out.println("전체 행의 갯수:"+totRowCount);
		PageUtil pu=new PageUtil(pageNum, totRowCount, 5, 3);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		
		List<SellerSalesJoinVo> list1=service.getSalesList(map);
		System.out.println("리스트:"+list1.size());
		model.addAttribute("list1", list1);
		model.addAttribute("tabType", tabType);
		model.addAttribute("pu", pu);
		return ".seller.salesManagement";
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/seller/salesManagement2")
	public String salesManage2(
			Model model,
			@RequestParam(value="tabType",defaultValue = "0")int tabType) {
		model.addAttribute("tabType", tabType);
		return ".seller.salesManagement";
	}
	
}
