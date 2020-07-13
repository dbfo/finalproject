package com.jhta.finalproject.yr.controller;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.yr.service.PaymentService;
import com.jhta.finalproject.yr.service.ShipManageService;
import com.jhta.finalproject.yr.vo.PaymentVo;

@Controller
public class SMBeforeDepositController {
	
	@Autowired
	private ShipManageService service;
	@Autowired
	private PaymentService payService;
	
	@RequestMapping("/ship")
	public String goShip(Model model, String pfield, String pkeyword, 
			String tfield, String startDate, String endDate, String bfield, String bkeyword, String mType) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
//		배송 상태 갯수 가져오기
		List<Integer> countlist = service.getShipCount();
		
		
//		검색하기
		map.put("pfield", pfield);
		map.put("pkeyword", pkeyword);
		map.put("tfield", tfield);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("bfield", bfield);
		map.put("bkeyword", bkeyword);
		map.put("mType", mType);
		
//		입금전 리스트 가져오기
		map.put("shipStatus", 0);
		
		List<PaymentVo> list = payService.allList(map);
		
		model.addAttribute("countList", countlist);
		model.addAttribute("list", list);
		
		return ".ship.beforeDeposit";
	}
	
	
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
