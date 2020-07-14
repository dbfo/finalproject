package com.jhta.finalproject.hd.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.hd.service.OrderService;
import com.jhta.finalproject.hd.vo.OrderResultVo;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
	
	// 장바구니에서 주문하기 클릭했을때 처리함.
	@RequestMapping(value="/order/order",method = RequestMethod.POST)
	public String order(@RequestParam(value="cartNum")int[]cartNum,Model model,HttpSession session) {
		ArrayList<Integer> data=new ArrayList<Integer>(Arrays.stream(cartNum).boxed().collect(Collectors.toList()));
		//https://fblens.com/entry/JAVA-Array%EB%A5%BC-List%EB%A1%9C-List%EB%A5%BC-Array%EB%A1%9C
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("datalist", data);
		String path=session.getAttribute("cp")+"/resources/hd/image";
		List<OrderResultVo> list=service.inputorderlist(map);
		int totalprice=0;
		int totalpoint=0;
		for(OrderResultVo vo:list) {
			String imgpath=path+"\\"+vo.getImgsavefilename();
			int point=vo.getBpoint();
			int price=vo.getBprice();
			int bcount=vo.getBcount();
			totalprice+=(price*bcount);
			totalpoint+=(point*bcount);
			vo.setTotalpoint(point*bcount);
			vo.setTotalvalue(price*bcount);
			vo.setImgpath(imgpath);
		}
		model.addAttribute("list", list);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("totalpoint", totalpoint);
		return ".order";
	}
	
	//주문페이지에서 배송지 얻어옴.
	@RequestMapping(value="/order/getAddr",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getShipAddr(HttpSession session) {
		int mnum=(int)session.getAttribute("mnum");
		JSONObject json=new JSONObject();
		String addr1="";
		String addr2="";
		String addr3="";
		String addr4="";
		String addr5="";
		if(mnum!=0) {
			String addrValue=service.getAddr(mnum);
			//06000|서울 강남구 강남대로 708|서울 강남구 압구정동 386-1|z| (압구정동)
			String [] addrGroup=addrValue.split("\\|");
			addr1=addrGroup[0];
			addr2=addrGroup[1];
			addr3=addrGroup[2];
			addr4=addrGroup[3];
			addr5=addrGroup[4];	 
		}
		json.put("addr1", addr1); 
		json.put("addr2", addr2);
		json.put("addr3", addr3);
		json.put("addr4", addr4);
		json.put("addr5", addr5);
		return json.toString();
	}
	//주문페이지에서 현재 사용가능한 포인트조회..
	@RequestMapping(value="/order/usablepoint",method=RequestMethod.POST)
	@ResponseBody
	public String usablepoint(HttpSession session) {
		int mnum=(int)session.getAttribute("mnum");
		int point=service.getPoint(mnum);
		JSONObject json=new JSONObject();
		json.put("point", point);
		return json.toString();
	}
}
