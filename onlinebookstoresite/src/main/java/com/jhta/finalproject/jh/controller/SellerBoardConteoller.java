package com.jhta.finalproject.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerBoardConteoller {
	
	//중고판매자 QnA리스트
	@RequestMapping("/seller/qnalist")
	public String sellerQnaList() {
		return ".seller.qna";  
	}
}
