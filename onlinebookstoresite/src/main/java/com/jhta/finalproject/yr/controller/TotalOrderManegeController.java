package com.jhta.finalproject.yr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.finalproject.yr.service.PaymentService;
import com.jhta.finalproject.yr.vo.PaymentVo;

@Controller
public class TotalOrderManegeController {
	
	@Autowired
	public PaymentService service;
	
	@GetMapping("/totalOrder")
	public String home(Model model) {
		
		List<PaymentVo> list = service.allList();
		model.addAttribute("list", list);
		
		for (PaymentVo vo : list) {
			System.out.println(vo);
		}
		
		return ".totalOrder";
	}
	
	
//	주문검색결과
	
	
	@PostMapping("/yr/orderSearch")
	public String ordersearch(Model model, String pfield, String  pkeyword,
			String tfield, String  bfield, String bkeyword, String bstatus, String type, String payType,String mType ) {
//		주문번호, 주문자명
		System.out.println(pfield);
		System.out.println(pkeyword);
		
//		주문일, 결제일
		System.out.println(tfield);
		
		
//		책제목, 책번호
		System.out.println(bfield);
		System.out.println(bkeyword);

//		주문상태
		System.out.println(bstatus);
		
//		cs주문상태
//		refundhistory --- 0 : 없음, 1 :취소, 2: 반품, 3: 교환
		
		System.out.println(type);
		
//		입금/ 결제 상태
		System.out.println(payType);
		
//		회원타입(mname)
		System.out.println(mType);
		
		return ".totalOrder";
	}
	
	
}
