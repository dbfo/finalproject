package com.jhta.finalproject.yr.controller.sales;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SalesManageController {
	@RequestMapping("/sales")
	public String goSales() {
		return ".sales";
	}
	
	
	@RequestMapping("/sales/getInfo")
	@ResponseBody
	public String getInfo() {

		JSONArray arry = new JSONArray();
		JSONObject json = new JSONObject();
		json.put("code", "success");
		String[] data = {"1","15","30"};
		json.put("data",data);
		
		arry.put(json);
		
		return arry.toString();
	}
}
