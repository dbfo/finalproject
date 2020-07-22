package com.jhta.finalproject.yr.controller.order;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.yr.service.SellerDepositService;
import com.jhta.finalproject.yr.vo.UsedOldBookSellerInfoVo;

@Controller
public class SellerManageController {
	@Autowired
	private SellerDepositService service;
	
	@RequestMapping("/admin/seller")
	public String goSellerManage(Model model, String pfield, String pkeyword, 
			String tfield, String startDate, String endDate) { 
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pfield", pfield);	
		map.put("pkeyword", pkeyword);	
		map.put("tfield", tfield);	
		map.put("startDate", startDate);	
		map.put("endDate", endDate);	
		
		List<UsedOldBookSellerInfoVo> list = service.getList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pfield", pfield);	
		model.addAttribute("pkeyword", pkeyword);	
		model.addAttribute("tfield", tfield);	
		model.addAttribute("startDate", startDate);	
		model.addAttribute("endDate", endDate);	
		
		
		
		return ".usedbookseller";
	}
	
	@RequestMapping("/admin/depositToSeller")
	@ResponseBody
	public String DepositToSeller(@RequestParam(value = "bpaynum[]") List<Integer> bpaynum,
			@RequestParam(value = "sellernum[]") List<Integer> sellernum,
			@RequestParam(value = "price[]") List<Integer> price) {
		
		int n = 0;
		try {
			n = service.updateSellerDepositStatus(bpaynum, sellernum, price);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		JSONObject json = new JSONObject();

		if(n > 0) {
			json.put("code", "success");
		}else {
			json.put("code", "error");				
		}
		return json.toString(); 
	}
}
