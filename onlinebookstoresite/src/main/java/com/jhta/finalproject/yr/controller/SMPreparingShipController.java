package com.jhta.finalproject.yr.controller;

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
	@Autowired
	private PaymentService payService;
	
	@RequestMapping("/ship/preparing")
	public String goPreparingList(Model model, String pfield, String pkeyword, 
			String tfield, String startDate, String endDate, String bfield, String bkeyword, String mType){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		

		
//		배송 상태 갯수 가져오기
		List<HashMap<String, Object>> countlist = service.getShipCount();
		
//		for (HashMap<String, Object> map1 : countlist) {
//			String bstatus = String.valueOf(map1.get("BSTATUS"));
//			BigDecimal count = (BigDecimal)map1.get("COUNT");
//			
//			System.out.println("bstatus : " + bstatus);
//			System.out.println("count : " + count);
//		}
		
		
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
		
		
		List<PaymentAndBookListVo> list = payService.paymentList(map);

//		출력		
//		for (PaymentAndBookListVo vo : list) {
//			System.out.println(vo);
//			List<PaymentBooksVo> v1 = vo.getPaymentbook();
//			System.out.println("주문한 책 리스트");
//			for (PaymentBooksVo pavo : v1) {
//				System.out.println(pavo);
//			}
////			System.out.println("주문한 책 리스트");
////			List<BooksVO> v2 = vo.getBookinfo();
////			for (BooksVO pavo : v2) {
////				System.out.println(pavo);
////			}
//					
//		}
		
		
		 
		model.addAttribute("list", list);
		model.addAttribute("countList", countlist);
		
		model.addAttribute("path", "/preparing");
		
		
		return ".ship.preparingShip";
	}
	
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
