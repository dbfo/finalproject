package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerSalesManageController {
	
	@RequestMapping("/seller/salesManagement")
	public String salesManage() {
		return ".seller.salesManagement";
	}
}
