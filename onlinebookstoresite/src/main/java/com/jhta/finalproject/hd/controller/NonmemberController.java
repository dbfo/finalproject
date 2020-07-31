package com.jhta.finalproject.hd.controller;

import java.math.BigDecimal;
import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.hd.service.NonmemberService;
import com.jhta.finalproject.hd.service.OrderHistoryService;

@Controller
public class NonmemberController {
	@Autowired
	private OrderHistoryService ohservice;
	@Autowired
	private NonmemberService service;
	
	@RequestMapping("/nomem/inquiryorder")
	public String inquiryorder(int bpaynum,String phone) {
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("bpaynum", bpaynum);
		map.put("phone", phone);
		int n=service.confirmbpayment(map);
		String result="";
		JSONObject json=new JSONObject();
		if(n==0) {
			result="nothing";
			json.put("result", result);
			return json.toString();
		}
		HashMap<String, Object>resultmap=service.nomenOrder(map);
		int bstatus=((BigDecimal)resultmap.get("BSTATUS")).intValue();
		int btype=((BigDecimal)resultmap.get("BTYPE")).intValue();
		System.out.println("컨트롤러안 bstatus:"+bstatus);
		System.out.println("컨트롤러안 btype:"+btype);
		if(bstatus==4) {
			result="applycancel";
			json.put("result", result);
			return json.toString();
		}else if(bstatus==5) {
			result="confirmcancel";
			json.put("result", result);
			return json.toString();
		}else if(bstatus==6) {
			result="cancelorder";
			json.put("result", result);
			return json.toString();
		}else {
			result="success";
		}
		
		json.put("bpaynum", bpaynum);
		json.put("result", result);
		return json.toString();
	}
}
