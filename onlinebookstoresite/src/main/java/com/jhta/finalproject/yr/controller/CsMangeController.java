package com.jhta.finalproject.yr.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.yr.service.CSManageService;
import com.jhta.finalproject.yr.vo.PaymentAndCSBookListVo;

@Controller
public class CsMangeController {
	
	@Autowired
	private CSManageService service;

	@RequestMapping("/cs/cancelModal")
	public String openCancelModal(Model model, String bpaynum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bpaynum", bpaynum);
		
		List<PaymentAndCSBookListVo> list = service.paymentList(map);
		
	
//		for (PaymentAndCSBookListVo vo : list) {
//			System.out.println(vo);
//		}

		model.addAttribute("List",list);
		
		return "/admin/yr/cs/cancelModal";
	}
}
