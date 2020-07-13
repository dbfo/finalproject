package com.jhta.finalproject.hd.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.hd.service.OrderService;
import com.jhta.finalproject.hd.vo.OrderParameterVo;
import com.jhta.finalproject.hd.vo.OrderResultVo;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
	/*
	 @RequestParam("bnum") int bnum
	,@RequestParam("bcount") int bcount
	,@RequestParam(value="cartNum",defaultValue = "0") int cartNum
	 */
	@RequestMapping(value="/pay/order",method = RequestMethod.POST)
	public String order(@RequestParam(value="cartNum")int[]cartNum,Model model,HttpSession session) {
		ArrayList<Integer> data=new ArrayList<Integer>(Arrays.stream(cartNum).boxed().collect(Collectors.toList()));
		//https://fblens.com/entry/JAVA-Array%EB%A5%BC-List%EB%A1%9C-List%EB%A5%BC-Array%EB%A1%9C
		System.out.println("컨트롤러안 cartNum : "+data.get(0));
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("datalist", data);
		String path=session.getAttribute("cp")+"/resources/hd/image";
		List<OrderResultVo> list=service.inputorderlist(map);
		for(OrderResultVo vo:list) {
			String imgpath=path+"\\"+vo.getImgsavefilename();
			int point=vo.getBpoint();
			int price=vo.getBprice();
			int bcount=vo.getBcount();
			vo.setTotalpoint(point*bcount);
			vo.setTotalvalue(price*bcount);
			vo.setImgpath(imgpath);
		}
		model.addAttribute("list", list);
		return ".order";
	}
}
