package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SellerSettlementCheck {
	
	@RequestMapping("/seller/settlementCheck")
	public String settlementCheckList() {
		
		return ".seller.settlementCheck";
	}
}
