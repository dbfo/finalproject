package com.jhta.finalproject.yr.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.yr.service.PaymentService;
import com.jhta.finalproject.yr.service.ShipManageService;
import com.jhta.finalproject.yr.vo.PaymentVo;

@Controller
public class SMPreparingShipController {
	@Autowired
	private ShipManageService service;
	@Autowired
	private PaymentService payService;
	
	@RequestMapping("/ship/preparing")
	public String goPreparingList(Model model, String pfield, String pkeyword, 
			String tfield, String startDate, String endDate, String bfield, String bkeyword, String mType){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
//		배송 상태 갯수 가져오기
		List<Integer> countlist = service.getShipCount();
		
//		System.out.println(	"2pfield : "+ pfield
//		+" 2pkeyword : "+ pkeyword
//		+" 2tfield : "+ tfield
//		+" 2startDate :"+ startDate
//		+" 2endDate : "+ endDate
//		+" 2bfield : "+ bfield
//		+" 2bkeyword : "+ bkeyword
//		+ " 2mType :"+ mType
//		);
		
//		검색하기
		map.put("pfield", pfield);
		map.put("pkeyword", pkeyword);
		map.put("tfield", tfield);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("bfield", bfield);
		map.put("bkeyword", bkeyword);
		map.put("mType", mType);
		

		
//		배송 준비중 리스트 가져오기
		map.put("shipStatus",1);
		
		
		List<PaymentVo> list = payService.allList(map);
		
		model.addAttribute("countList", countlist);
		model.addAttribute("list", list);
		
		model.addAttribute("path", "/preparing");
		
		return ".ship.preparingShip";
	}
}
