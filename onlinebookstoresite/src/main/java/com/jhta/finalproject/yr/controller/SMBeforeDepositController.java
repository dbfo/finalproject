package com.jhta.finalproject.yr.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.yr.service.ShipManageService;

@Controller
public class SMBeforeDepositController {
	
	@Autowired
	private ShipManageService service;
	
//	입금확인 눌렸을 경우
	@RequestMapping(value="/ship/checkDeposit")
	@ResponseBody
	public String checkDeposit(@RequestParam(value="bpaynum[]") List<Integer> bpaynum){
		
		int n = service.updateBeforeToPreparing(bpaynum);
			
		JSONObject json = new JSONObject();
		if(n>0) {
			json.put("code","success");			
		}else {
			json.put("code","error");						
		}
		
		return json.toString();
	}	
}
