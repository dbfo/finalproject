package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerProdLookController {
	
	//========================중고상품 조회/수정메소드로 이동========================
	@RequestMapping("/seller/prodLook")
	public String sellerProdLook() {
		return ".seller.prodLook";
	}
}
