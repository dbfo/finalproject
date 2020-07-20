package com.jhta.finalproject.yr.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CSRefundManageController {
	
	@RequestMapping("/cs/refundMoneyGoMembers")
	@ResponseBody
	public String refundMoneyGoMembers( @RequestParam(value="senum[]") List<Integer> senum,
			@RequestParam(value="mnum[]") List<Integer> mnum) {
		
		
		//settlement 상태 바꾸기(상태, 정산 완료날짜)
		
		//예치금 인설트
		
		
		JSONObject json = new JSONObject();
		

		return json.toString();
	}
}
