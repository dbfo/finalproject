package com.jhta.finalproject.yr.controller.order;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.yr.service.PaymentService;
import com.jhta.finalproject.yr.service.ShipManageService;
import com.jhta.finalproject.yr.vo.PaymentAndBookListVo;

@Controller
public class SMPreparingShipController {
	@Autowired
	private ShipManageService service;
	
	@RequestMapping(value="/ship/changeToShipping")
	@ResponseBody
	public String changeToShipping(int bpaynum) {
		int n = service.updatePrepareToShipping(bpaynum);
		
		JSONObject json = new JSONObject();
		if(n>0) {
			json.put("code","success");			
		}else {
			json.put("code","error");						
		}
		
		return json.toString();
		
	}
	
}
