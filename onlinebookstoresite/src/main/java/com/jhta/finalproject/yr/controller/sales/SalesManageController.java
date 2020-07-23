package com.jhta.finalproject.yr.controller.sales;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.yr.service.SalesService;

@Controller
public class SalesManageController {
	
	@Autowired
	private SalesService service;
	
	@RequestMapping("/sales")
	public String goSales(Model model,String menu, String startDate, String endDate, String week,
			String startYear, String startMonth, String endYear, String endMonth) {
		
		System.out.println(
				 menu + " : "+ startDate + " : "+ endDate+ " : "+ week
				 + " : "+startYear+ " : "+ startMonth + " : "+endYear+ " : "+endMonth);
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("menu", menu);
		
		return ".sales";
	}
	
	
	@RequestMapping("/sales/getInfo")
	@ResponseBody
	public String getInfo(String menu, String startDate, String endDate, String week,
			String startYear, String startMonth, String endYear, String endMonth) {

		HashMap<String, Object> map	 = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		System.out.println(
				 menu + " :sd "+ startDate + " :ed "+ endDate+ " :w "+ week
				 + " :sy "+startYear+ " :sm "+ startMonth + " :ey "+endYear+ " :em "+endMonth);
		
		
		List<HashMap<String,String>> result = getDate( menu, startDate, endDate, week
				 , startYear, startMonth ,endYear, endMonth); 
		

		JSONArray arry = new JSONArray();
		JSONObject json = new JSONObject();
		List<Object> slabel = new ArrayList<Object>();
		List<Object> data = new ArrayList<Object>();
		if(result != null) {
			for (HashMap<String, String> hashMap : result) {
				for (String key	: hashMap.keySet()) {
					if(key.equals("BPAYDATE")){
						slabel.add(hashMap.get(key));					
					}else {
						data.add(hashMap.get(key));					
					}
				}
			}
			
			
			json.put("code", "success");
			json.put("label",slabel);
			json.put("data",data);
			
			arry.put(json);
			
		}else {
			json.put("code", "error");
			arry.put(json);			
		}
	
		return arry.toString();
	}
	
	public List<HashMap<String,String>> getDate(String menu, String startDate, String endDate, String week,
			String startYear, String startMonth, String endYear, String endMonth) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		
		if(menu.equals("1")) {
			map.put("menu", menu);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			
			result = service.getList(map);
		}else if(menu.equals("2")) {

			if(week != null && week != "") {
				int iweek = Integer.parseInt(week);
				iweek = (iweek-1) * 7;
				map.put("week", iweek);
				result = service.weekList(map);
			}
			
		}else if(menu.equals("3")) {

			String startYearAndMonth= startYear + "-" +  startMonth;
			int iendMonth = Integer.parseInt(endMonth)+1;
			int iendYear = Integer.parseInt(endYear);
			
			if(iendMonth >12) {
				iendYear = iendYear + 1;
			}
			String endYearAndMonth= iendYear + "-" +  iendMonth;
			map.put("startYearAndMonth",startYearAndMonth);
			map.put("endYearAndMonth",endYearAndMonth);
			
			result = service.mothList(map);
		}
	
		return result;
	}
}