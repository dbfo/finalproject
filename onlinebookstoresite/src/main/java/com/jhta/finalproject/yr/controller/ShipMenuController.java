package com.jhta.finalproject.yr.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.yr.service.PaymentService;
import com.jhta.finalproject.yr.service.ShipManageService;
import com.jhta.finalproject.yr.vo.PaymentAndBookListVo;

@Controller
public class ShipMenuController {
	
	@Autowired
	private PaymentService payService;
	@Autowired
	private ShipManageService service;
	
	@RequestMapping("/ship/menu")
	public String goMenu(Model model ,String PageName,String pfield, String pkeyword, 
			String tfield, String startDate, String endDate, String bfield, String bkeyword, String mType) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
//		배송 상태 갯수 가져오기
		List<HashMap<String, Object>> countlist = service.getShipCount();
		
		System.out.println(	"2pfield : "+ pfield
		+" 2pkeyword : "+ pkeyword
		+" 2tfield : "+ tfield
		+" 2startDate :"+ startDate
		+" 2endDate : "+ endDate
		+" 2bfield : "+ bfield
		+" 2bkeyword : "+ bkeyword
		+ " 2mType :"+ mType
		);
		
		
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
		
		map.put("shipStatus", PageName);			


		
		List<PaymentAndBookListVo> list = payService.paymentList(map);
		
		model.addAttribute("countList", countlist);
		model.addAttribute("list", list);
		
		model.addAttribute("list", list);
		model.addAttribute("pfield",pfield);
		model.addAttribute("pkeyword",pkeyword);
		model.addAttribute("tfield",tfield);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		model.addAttribute("bfield",bfield);
		model.addAttribute("bkeyword",bkeyword);
		model.addAttribute("mType",mType);		
		
		
		if(PageName.equals("0")) {
			model.addAttribute("path",0);		
			return ".ship.beforeDeposit";
		}else if(PageName.equals("1")) {
			return ".ship.preparingShip";
		}else if(PageName.equals("2")) {
			return ".ship.shipInfo";
		}else if(PageName.equals("3")) {
		
		}
		
		return "error";
	}
}
