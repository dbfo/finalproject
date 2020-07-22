package com.jhta.finalproject.hd.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.hd.service.OrderHistoryService;
import com.jhta.finalproject.hd.vo.HistoryListVo;

@Controller
public class OrderHistoryController {
	@Autowired
	private OrderHistoryService service;
	
	@RequestMapping("/mypage/orderhistory")
	public String pageorderhistory() {
		return ".orderhistory";
	}
	
	@RequestMapping(value="/orderhistroy/newview",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String vieworderhistroy(HttpSession session,@RequestParam(required=false)String startDay,
											@RequestParam(required = false)String endDay,@RequestParam(defaultValue = "1")int pageNum) {
		
		
		String smnum=(String)session.getAttribute("mnum");
		int mnum=Integer.parseInt(smnum);
		System.out.println("mnum:"+mnum);
		HashMap<String,Object>datemap=new HashMap<String, Object>();
		datemap.put("startDay", startDay);
		datemap.put("endDay",endDay);
		datemap.put("mnum",mnum);
		int totalcount=service.countHistory(datemap);
		PageUtil pu=new PageUtil(pageNum, totalcount, 8, 5);
		datemap.put("startRow", pu.getStartRow());
		datemap.put("endRow", pu.getEndRow());
		List<HistoryListVo> list=service.orderhistory(datemap);
		List<HistoryListVo> list1=new ArrayList<HistoryListVo>();
		for(HistoryListVo vo:list) {
			System.out.println("주문일자:"+vo.getBorderdate());
			int bpaynum=vo.getOrdernum();
			HashMap<String,Object>map=service.confirmtype(bpaynum);		
			int btype=Integer.parseInt(String.valueOf(map.get("BTYPE")));
			int bnum=Integer.parseInt(String.valueOf(map.get("BNUM")));
			if(btype==1){
				int bfinalmoney=vo.getBfinalmoney();
				int delfee=vo.getDelfee();
				vo.setOrdermoney(bfinalmoney+delfee);
				
				vo.setBtype(btype);
				
				int count=service.countPaymentBook(bpaynum);
				String btitle=service.newBtitle(bnum);
				String ordername=btitle;
				if(count>1) {
					ordername+=" 외 "+(count-1)+"종";
				}
				vo.setOrdername(ordername);	
				list1.add(vo);
			}		
		}
		JSONArray jarr=new JSONArray();
		for(HistoryListVo vo1:list1) {
			JSONObject json=new JSONObject();
			json.put("ordernum", vo1.getOrdernum());
			json.put("borderdate", vo1.getBorderdate());
			String status="";
			int bstatus=vo1.getBstatus();
			if(bstatus==0) {
				status="주문";
			}else if(bstatus==1) {
				status="결제완료";
			}else if(bstatus==2) {
				status="배송중";
			}else if(bstatus==3) {
				status="수령완료(구매확정)";
			}else if(bstatus==4) {
				status="반품신청";
			}else if(bstatus==5) {
				status="반품완료";
			}
			
			json.put("bstatus", bstatus);
			json.put("status", status);
			json.put("ordermoney", vo1.getOrdermoney());
			json.put("mname", vo1.getMname());
			json.put("receiver", vo1.getReceiver());
			json.put("ordername", vo1.getOrdername());
			jarr.put(json);
		}
		JSONObject json=new JSONObject();
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
	@RequestMapping("/orderhistroy/usedview")
	@ResponseBody
	public String viewusedorderhistroy(HttpSession session,@RequestParam(defaultValue = "0")String date1,
											@RequestParam(defaultValue = "0")String date2) {
		String smnum=(String)session.getAttribute("mnum");
		int mnum=Integer.parseInt(smnum);
		HashMap<String, Object>datemap=new HashMap<String, Object>();
		List<HistoryListVo> list=service.orderhistory(datemap);
		List<HistoryListVo> list1=new ArrayList<HistoryListVo>();
		for(HistoryListVo vo:list) {
			int bpaynum=vo.getOrdernum();
			HashMap<String,Object>map=service.confirmtype(bpaynum);
			int btype=Integer.parseInt(String.valueOf(map.get("BTYPE")));
			int bnum=Integer.parseInt(String.valueOf(map.get("BNUM")));
			if(btype==2) {
				int bfinalmoney=vo.getBfinalmoney();
				int delfee=vo.getDelfee();
				vo.setOrdermoney(bfinalmoney+delfee);
				vo.setBtype(btype);
				
				int count=service.countPaymentBook(bpaynum);
				HashMap<String,Object> usedmap=service.usedBtitle(bnum);
				String btitle=(String)usedmap.get("obname");
				int status=(int)usedmap.get("obstatus");
				String statusString="";
				if(status==1) {
					statusString="[중고-최상]";
				}else if(status==2) {
					statusString="[중고-상]";
				}else if(status==3) {
					statusString="[중고-중]";
				}else if(status==4) {
					statusString="[중고-하]";
				}
				String ordername=statusString+" "+btitle;
				if(count>1) {
					ordername=" 외 "+(count-1)+"종";
				}
				vo.setOrdername(ordername);
				list1.add(vo);
			}				
		}
		JSONArray jarr=new JSONArray();
		for(HistoryListVo vo1:list1) {
			JSONObject json=new JSONObject();
			json.put("ordernum", vo1.getOrdernum());
			json.put("borderdate", vo1.getBorderdate());
			json.put("bstatus", vo1.getBstatus());
			json.put("ordermoney", vo1.getOrdermoney());
			json.put("mname", vo1.getMname());
			json.put("receiver", vo1.getReceiver());
			json.put("ordername", vo1.getOrdername());
			jarr.put(json);
		}
	
		return jarr.toString();
	}
}
