package com.jhta.finalproject.hd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.hd.service.HomeService;
import com.jhta.finalproject.hd.vo.HomeBestVo;
import com.jhta.page.util.PageUtil;


@Controller
public class HomeJsonController {
	@Autowired
	private HomeService service;
	
	//홈화면 베스트셀러.신간.
	@RequestMapping(value="/home/bestlist",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String bestlist(HttpSession session,@RequestParam(value="pageNum",defaultValue = "1")int pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		PageUtil pu=new PageUtil(pageNum, 10, 5, 5);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		String path=session.getAttribute("cp")+"/resources/image";
		List<HomeBestVo> list=service.bestlist(map);
		JSONArray jarr=new JSONArray();
		for(HomeBestVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("bnum", vo.getBnum());
			json.put("btitle", vo.getBtitle());
			System.out.println("컨트롤러안 title : "+vo.getBtitle());
			json.put("bwriter", vo.getBwriter());
			json.put("bpublisher", vo.getBpublisher());
			json.put("bprice", vo.getBprice());
			String imgpath=path+"\\"+vo.getImgsavefilename();
			json.put("imgsrc",imgpath );
			System.out.println("컨트롤러안 imgsrc : "+imgpath);
			jarr.put(json);
		}
		return jarr.toString();
	}
	@RequestMapping(value="/home/newlist",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String newtlist(HttpSession session,@RequestParam(value="pageNum",defaultValue = "1")int pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		PageUtil pu=new PageUtil(pageNum, 10, 5, 5);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		String path=session.getAttribute("cp")+"/resources/image";
		List<HomeBestVo> list=service.newlist(map);
		JSONArray jarr=new JSONArray();
		for(HomeBestVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("bnum", vo.getBnum());
			json.put("btitle", vo.getBtitle());
			System.out.println("컨트롤러안 title : "+vo.getBtitle());
			json.put("bwriter", vo.getBwriter());
			json.put("bpublisher", vo.getBpublisher());
			json.put("bprice", vo.getBprice());
			String imgpath=path+"\\"+vo.getImgsavefilename();
			json.put("imgsrc",imgpath );
			System.out.println("컨트롤러안 imgsrc : "+imgpath);
			jarr.put(json);
		}
		return jarr.toString();
	}
}
