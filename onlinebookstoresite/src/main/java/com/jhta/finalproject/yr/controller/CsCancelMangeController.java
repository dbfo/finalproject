package com.jhta.finalproject.yr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.yr.service.CSManageService;
import com.jhta.finalproject.yr.service.CancelService;
import com.jhta.finalproject.yr.vo.CSAndPaymentBookVo;
import com.jhta.finalproject.yr.vo.PaymentAndCSBookListVo;
import com.jhta.finalproject.yr.vo.PaymentBooksVo;
import com.jhta.finalproject.yr.vo.PaymentVo;

@Controller
public class CsCancelMangeController {
	
	@Autowired
	private CSManageService service;
	@Autowired
	private CancelService cservice;

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
		
		System.out.println("bpaynum : " + bpaynum);
		
		List<PaymentAndCSBookListVo> list = service.paymentList(map);
		
		//list안에 환불한 책 갯수세기(새로운 주문 만들기)
		//책정보
	
		PaymentVo cancelPayment = new PaymentVo();
		List<PaymentBooksVo> paymentbookList = new ArrayList<PaymentBooksVo>();
		
		for (PaymentAndCSBookListVo vo : list) {
			
			cancelPayment = new PaymentVo(0,vo.getBaddr(),vo.getBphone(),0,vo.getBorderdate(),
					null,0,0,0,vo.getMethodpayment(),vo.getReceiver(),vo.getMnum());
			
			List<CSAndPaymentBookVo> bookList = vo.getCSAndPaymentBook();
			
			for (CSAndPaymentBookVo blist : bookList) {				
				if(blist.getBcount() - blist.getCount() > 0) { //주문한 책 갯수 - 취소한 책 갯수 
					paymentbookList.add(new PaymentBooksVo(0, 0, 1, blist.getBnum(), blist.getBcount() - blist.getCount()));
				}else if(blist.getType() != 1) { //취소하지 않은 책
					paymentbookList.add(new PaymentBooksVo(0, 0, 1, blist.getBnum(), blist.getBcount()));
				}
			}
		}
		
		if(!paymentbookList.isEmpty() && cancelPayment != null) {
			//insert
			int n = cservice.makeCancelPayment(cancelPayment, paymentbookList);
			if(n < 1) {
				System.out.println("insert 실패ㅜㅜㅜ");
			}else {
				System.out.println("성공");
			}
		}
		
		//update
		
		
		
		JSONObject json = new JSONObject();
		json.put("code", "success");
		
		
		
		return json.toString();
	}
}
