package com.jhta.finalproject.hd.controller;

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

import com.jhta.finalproject.hd.service.MyPageService;
import com.jhta.finalproject.hd.vo.HistoryListVo;
import com.jhta.finalproject.hd.vo.QnaHistoryVo;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	@RequestMapping("/mypage/main")
	public String conMyPage() {
		
		
		
		
		return ".mypage";
	}
	@RequestMapping("/mypage/cancelhistorypage")
	public String cancelHistorypage() {
		return ".cancelhistory";
	}
	@RequestMapping("/mypage/qnapage")
	public String qnapage() {
		return ".qnahistory";
	}
	@RequestMapping("/mypage/returnpage")
	public String returnPage() {
		return ".returnhistory";
	}
	//새상품 취소내역.
	@RequestMapping(value="/mypage/cancelhistory",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String cancelhistory(HttpSession session,@RequestParam(required=false)String startDay,String value,
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
			String status="";
			int bstatus=vo1.getBstatus();
			if(bstatus==6) {
				status="취소";
			}else if(bstatus==4) {
				status="반품신청";
			}else if(bstatus==5) {
				status="반품완료";
			}
			
			json.put("bstatus", bstatus);
			json.put("status", status);
			json.put("ordermoney", vo1.getOrdermoney());
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
	//중고상품 취소내역
		@RequestMapping(value="/mypage/usedcancelhistory",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
		@ResponseBody
		public String viewusedorderhistroy(HttpSession session,@RequestParam(required=false)String startDay,String value,
				@RequestParam(required = false)String endDay,@RequestParam(defaultValue = "1")int pageNum) {
			String smnum=(String)session.getAttribute("mnum");
			int mnum=Integer.parseInt(smnum);
			HashMap<String,Object>datemap=new HashMap<String, Object>();
			datemap.put("startDay", startDay);
			datemap.put("endDay",endDay);
			datemap.put("mnum",mnum);
			datemap.put("value",value);
			datemap.put("separate","used");
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
				HashMap<String,Object> usedmap=service.usedBtitle(bnum);
				String btitle=(String)usedmap.get("OBNAME");
				int status=Integer.parseInt(String.valueOf(usedmap.get("OBSTATUS")));
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
					ordername+=" 외 "+(count-1)+"종";
				}
				vo.setOrdername(ordername);
							
			}
			JSONArray jarr=new JSONArray();
			for(HistoryListVo vo1:list) {
				JSONObject json=new JSONObject();
				json.put("ordernum", vo1.getOrdernum());
				json.put("borderdate", vo1.getBorderdate());
				String status="";
				int bstatus=vo1.getBstatus();
				if(bstatus==6) {
					status="취소";
				}else if(bstatus==4) {
					status="반품신청";
				}else if(bstatus==5) {
					status="반품완료";
				}
				
				json.put("bstatus", bstatus);
				json.put("status", status);
				json.put("ordermoney", vo1.getOrdermoney());
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
		//문의사항
		@RequestMapping(value="/mypage/qnahistory",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
		@ResponseBody
		public String viewQnaList(HttpSession session,@RequestParam(required=false)String startDay,String value,
				@RequestParam(required = false)String endDay,@RequestParam(defaultValue = "1")int pageNum) {
			String smnum=(String)session.getAttribute("mnum");
			int mnum=Integer.parseInt(smnum);
			HashMap<String,Object>datemap=new HashMap<String, Object>();
			datemap.put("startDay", startDay);
			datemap.put("endDay",endDay);
			datemap.put("mnum",mnum);
			datemap.put("value",value);
			int totalcount=service.countQnaHistory(datemap);
			PageUtil pu=new PageUtil(pageNum, totalcount, 8, 5);
			datemap.put("startRow", pu.getStartRow());
			datemap.put("endRow", pu.getEndRow());
			List<QnaHistoryVo> list=service.qnahistory(datemap);
			JSONArray jarr=new JSONArray();
			for(QnaHistoryVo vo:list) {
				JSONObject json=new JSONObject();
				json.put("qnanum", vo.getQnanum());
				json.put("qnadate", vo.getQnadate());
				String status="";
				int qnastatus=vo.getQnastatus();
				if(qnastatus==0) {
					status="처리중";
				}else {
					status="완료";
				}				
				json.put("qnastatus", qnastatus);
				json.put("status", status);
				json.put("qnatitle", vo.getQnatitle());
				json.put("qnacontent", vo.getQnacontent());
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
		//반품/취소내역
		@RequestMapping(value="/mypage/newReturnhistory",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
		@ResponseBody
		public String viewNewReturnhistroy(HttpSession session,@RequestParam(required=false)String startDay,String value,
				@RequestParam(required = false)String endDay,@RequestParam(defaultValue = "1")int pageNum) {
			String smnum=(String)session.getAttribute("mnum");
			int mnum=Integer.parseInt(smnum);
			HashMap<String,Object>datemap=new HashMap<String, Object>();
			datemap.put("startDay", startDay);
			datemap.put("endDay",endDay);
			datemap.put("mnum",mnum);
			datemap.put("separate", "new");
			datemap.put("value",value);
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
				String status="";
				int bstatus=vo1.getBstatus();
				if(bstatus==6) {
					status="취소";
				}else if(bstatus==4) {
					status="반품/교환신청";
				}else if(bstatus==5) {
					status="처리완료";
				}
				
				json.put("bstatus", bstatus);
				json.put("status", status);
				json.put("ordermoney", vo1.getOrdermoney());
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
		//반품/취소내역
		@RequestMapping(value="/mypage/usedReturnhistory",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
		@ResponseBody
		public String viewUsedReturnhistroy(HttpSession session,@RequestParam(required=false)String startDay,String value,
				@RequestParam(required = false)String endDay,@RequestParam(defaultValue = "1")int pageNum) {
			String smnum=(String)session.getAttribute("mnum");
			int mnum=Integer.parseInt(smnum);
			HashMap<String,Object>datemap=new HashMap<String, Object>();
			datemap.put("startDay", startDay);
			datemap.put("endDay",endDay);
			datemap.put("mnum",mnum);
			datemap.put("separate", "new");
			datemap.put("value",value);
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
				String status="";
				int bstatus=vo1.getBstatus();
				if(bstatus==6) {
					status="취소";
				}else if(bstatus==4) {
					status="반품신청";
				}else if(bstatus==5) {
					status="반품완료";
				}
				
				json.put("bstatus", bstatus);
				json.put("status", status);
				json.put("ordermoney", vo1.getOrdermoney());
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
		
		//문의사항 작성 컨트롤러
		@RequestMapping(value="/mypage/writeqna",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
		@ResponseBody
		public String writeqna(String qnatitle,String qnacontent,HttpSession session) {
			String smnum=(String)session.getAttribute("mnum");
			int mnum=Integer.parseInt(smnum);
			HashMap<String, Object>map=new HashMap<String, Object>();
			map.put("qnatitle", qnatitle);
			map.put("mnum", mnum);
			map.put("qnacontent", qnacontent);
			int n=service.qnawrite(map);
			boolean result=false;
			if(n>0) {
				result=true;
			}
			JSONObject json=new JSONObject();
			json.put("result", result);
			return json.toString();
		}
		
		
		
}
