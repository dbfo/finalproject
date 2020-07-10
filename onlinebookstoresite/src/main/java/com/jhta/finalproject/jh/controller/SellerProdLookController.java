package com.jhta.finalproject.jh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.jh.service.SellerProdLookService;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;

@Controller
public class SellerProdLookController {
	@Autowired 
	private SellerProdLookService service;
	
	//========================중고상품 조회/수정메소드로 이동========================
	@RequestMapping("/seller/prodLook")
	public String sellerProdLook(Model model) {
		int snum=1;//판매자번호 추후 세션에서 받아오기
		List<SellerOldbooksVo> list=service.allList(snum);
		model.addAttribute("list", list);
		return ".seller.prodLook";
	}
}
