package com.jhta.finalproject.yr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.yr.service.CSManageService;
import com.jhta.finalproject.yr.vo.CSAndPaymentBookVo;
import com.jhta.finalproject.yr.vo.PaymentAndCSBookListVo;

@Controller
public class CsCanCelMangeController {
	
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
	
	
	@RequestMapping("/cs/cancelapproval")
	@ResponseBody
	public String cancelApproval(String bpaynum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bpaynum", bpaynum);
		
		List<PaymentAndCSBookListVo> list = service.paymentList(map);
		
		//list안에 환불한 책 갯수세기(새로운 주문 만들기)
		//책정보
		HashMap<Integer, Integer> bookmap = new HashMap<Integer, Integer>();
		
		for (PaymentAndCSBookListVo vo : list) {
			List<CSAndPaymentBookVo> bookList = vo.getCSAndPaymentBook();
			for (CSAndPaymentBookVo blist : bookList) {
				if(blist.getBcount() - blist.getCount() > 0) { //주문한 책 갯수 - 취소한 책 갯수 
					bookmap.put(blist.getBnum(),blist.getBcount() - blist.getCount());
				}
				if(blist.getType() != 1) {
					bookmap.put(blist.getBnum(),blist.getBcount());					
				}
			}
		}
		
		
		
		
		return "";
	}
}
