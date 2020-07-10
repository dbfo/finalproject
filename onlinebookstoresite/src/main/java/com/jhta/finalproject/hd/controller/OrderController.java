package com.jhta.finalproject.hd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.hd.vo.OrderParameterVo;

@Controller
public class OrderController {
	
	/*
	 @RequestParam("bnum") int bnum
	,@RequestParam("bcount") int bcount
	,@RequestParam(value="cartNum",defaultValue = "0") int cartNum
	 */
	@RequestMapping(value="/pay/order",method = RequestMethod.POST)
	public String order(OrderParameterVo vo,Model model) {
		
		
		return ".order";
	}
}
