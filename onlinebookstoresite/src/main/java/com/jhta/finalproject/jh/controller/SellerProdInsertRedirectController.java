package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerProdInsertRedirectController {
	@RequestMapping("/seller/insertOk")
	public String sellerInsertOk() {
		return ".seller.insertok";
	}
}
