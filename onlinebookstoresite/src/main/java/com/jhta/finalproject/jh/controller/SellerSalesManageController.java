package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SellerSalesManageController {
	
	//판매관리 메소드(입금대기중)
	@RequestMapping("/seller/salesManagement")
	public String salesManage(
			Model model,
			@RequestParam(value="tabType",defaultValue = "1")int tabType) {
			
		
		
		
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
