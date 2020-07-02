package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerProductInController {
	@RequestMapping("/seller/productInput")
	public String sellerProdInput() {
		return ".seller.product";
	}
}
