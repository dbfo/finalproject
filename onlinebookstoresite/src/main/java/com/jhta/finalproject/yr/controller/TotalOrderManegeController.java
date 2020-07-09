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
	
	
	
//	@PostMapping("/yr/orderSearch")
	
}
