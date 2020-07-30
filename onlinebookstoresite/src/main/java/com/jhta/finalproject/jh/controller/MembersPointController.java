package com.jhta.finalproject.jh.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jh.service.MembersPointService;
import com.jhta.finalproject.jh.vo.MembersPointVo;
import com.jhta.page.util.PageUtil;

@Controller
public class MembersPointController {
	@Autowired
	private MembersPointService service;
	
	@RequestMapping("/members/pointList")
	public String showPointList() {
		return ".point";
	}
	
	//포인트내역조회
	@RequestMapping(value="/members/point",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String membersPoint(HttpSession session,Model model,
			@RequestParam(required=false)String startDay,String value,
			@RequestParam(required = false)String endDay,
			@RequestParam(value="pageNum",defaultValue = "1")int pageNum) {
		int mnum=Integer.parseInt((String)session.getAttribute("mnum"));//회원번호
		String startDay1=startDay.replaceAll("/", "-");
		String endDay1=endDay.replaceAll("/", "-");
		System.out.println("시작날짜:"+startDay1);
		System.out.println("종료날짜:"+endDay1);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startDay",startDay);
		map.put("endDay",endDay);
		map.put("value",value);
		map.put("mnum",mnum);
		int totalRowCount=service.getRowPointCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 3);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<MembersPointVo> list=service.getPointList(map);
		JSONArray jarr=new JSONArray();
		for(MembersPointVo vo: list) {
			JSONObject json=new JSONObject();
			json.put("mnum", vo.getMnum());
			json.put("bpaynum", vo.getBpaynum());
			json.put("tranpoint", vo.getTranpoint());
			if(vo.getTranpoint()>0) {
				json.put("value", "포인트 적립");
			}else if(vo.getTranpoint()<0) {
				json.put("value", "포인트 사용");
			}
			json.put("pregdate", vo.getPregdate());
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
