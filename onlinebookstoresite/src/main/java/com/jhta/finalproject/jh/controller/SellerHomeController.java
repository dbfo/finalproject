package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerHomeController {
	
	//====================중고판매자 페이지이동==========================
	@RequestMapping(value = "/seller")
	public String sellerTest() {
		return ".seller";
	}
}
