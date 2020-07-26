package com.jhta.finalproject.hd.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.hd.vo.HistoryListVo;

@Controller
public class MyPageController {
	@RequestMapping("/mypage/main")
	public String conMyPage() {
		return ".mypage";
	}
	@RequestMapping("/mypage/cancelhistorypage")
	public String cancelHistorypage() {
		return ".cancelhistory";
	}
	@RequestMapping("/mypage/cancelhistory")
	@ResponseBody
	public String cancelhistory(HttpSession session,@RequestParam(required=false)String startDay,
			@RequestParam(required = false)String endDay,@RequestParam(defaultValue = "1")int pageNum) {
		String smnum=(String)session.getAttribute("mnum");
		int mnum=Integer.parseInt(smnum);
		HashMap<String,Object>datemap=new HashMap<String, Object>();
		datemap.put("startDay", startDay);
		datemap.put("endDay",endDay);
		datemap.put("mnum",mnum);
		datemap.put("separate", "new");
		int totalcount=service.countHistory(datemap);
		PageUtil pu=new PageUtil(pageNum, totalcount, 8, 5);
		datemap.put("startRow", pu.getStartRow());
		datemap.put("endRow", pu.getEndRow());
		List<HistoryListVo> list=service.orderhistory(datemap);
		for(HistoryListVo vo:list) {
			int bpaynum=vo.getOrdernum();
			HashMap<String,Object>map=service.confirmtype(bpaynum);		
			int bnum=Integer.parseInt(String.valueOf(map.get("BNUM")));		
			int bfinalmoney=vo.getBfinalmoney();
			int delfee=vo.getDelfee();
			vo.setOrdermoney(bfinalmoney+delfee);
			int count=service.countPaymentBook(bpaynum);
			String btitle=service.newBtitle(bnum);
			String ordername=btitle;
			if(count>1) {
				ordername+=" 외 "+(count-1)+"종";
			}
			vo.setOrdername(ordername);			
		}
		JSONArray jarr=new JSONArray();
		for(HistoryListVo vo1:list) {
			JSONObject json=new JSONObject();
			json.put("ordernum", vo1.getOrdernum());
			json.put("borderdate", vo1.getBorderdate());
			String status="취소";
			
			
			json.put("bstatus", 6);
			json.put("status", status);
			json.put("ordermoney", vo1.getOrdermoney());
			json.put("mname", vo1.getMname());
			json.put("receiver", vo1.getReceiver());
			json.put("ordername", vo1.getOrdername());
			jarr.put(json);
		}
		JSONObject json=new JSONObject();
		json.put("value", value);
		json.put("startDay", startDay);
		json.put("endDay", endDay);
		json.put("pageNum", pu.getPageNum());
		json.put("totalPageCount", pu.getTotalPageCount());
		json.put("startPageNum", pu.getStartPageNum());
		if(pu.getEndPageNum()>=pu.getTotalPageCount()) {
			pu.setEndPageNum(pu.getTotalPageCount());
		}
		json.put("endPageNum", pu.getEndPageNum());
		
		jarr.put(json);
		return jarr.toString();
	}
	
}
