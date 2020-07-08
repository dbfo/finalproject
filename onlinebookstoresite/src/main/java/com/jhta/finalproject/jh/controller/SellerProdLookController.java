package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerProdLookController {
	
	@RequestMapping("/seller/prodLook")
	public String sellerProdLook() {
		return ".seller.prodLook";
	}
}
