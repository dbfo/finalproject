package com.jhta.finalproject.jh.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.jh.service.SellerSalesManagementService;
import com.jhta.finalproject.jh.vo.SellerSalesJoinVo;

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
			@RequestParam(value="tabType",defaultValue = "1")int tabType) {
			
		int snum=1;//중고판매자번호 나중에 세션에서 얻어옴
		int bstatus=0;
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("snum", snum);
		map.put("bstatus",bstatus);
		List<SellerSalesJoinVo> list1=service.getSalesList(map);
		
		model.addAttribute("list1", list1);
		model.addAttribute("tabType", tabType);
		return ".seller.salesManagement";
	}
	
	@RequestMapping("/seller/salesManagement2")
	public String salesManage2(
			Model model,
			@RequestParam(value="tabType",defaultValue = "1")int tabType) {
		
		
		
		
		model.addAttribute("tabType", tabType);
		return ".seller.salesManagement";
	}
	
}
