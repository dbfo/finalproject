package com.jhta.finalproject.jh.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	//포인트내역
	@RequestMapping(value="/members/point",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String membersPoint(HttpSession session,Model model,
			@RequestParam(value="pregdate",defaultValue = "0")int pregdate,
			@RequestParam(value="pageNum",defaultValue = "1")int pageNum) {
		int mnum=Integer.parseInt((String)session.getAttribute("mnum"));//회원번호
		
		System.out.println("pregdate:"+pregdate);
		
		System.out.println("회원번호:"+mnum);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mnum",mnum);
		int totalRowCount=service.getRowPointCount(mnum);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 3);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("pregdate",pregdate);
		List<MembersPointVo> list=service.getPointList(map);
//		System.out.println("시작일자:"+startDay); 
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return ".point";
	}
}
