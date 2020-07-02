package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerHomeController {
	
	@RequestMapping(value = "/seller")
	public String sellerTest() {
		return ".seller";
	}
}
