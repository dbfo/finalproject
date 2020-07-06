package com.jhta.finalproject.jh.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.jh.service.SellerInsertService;
import com.jhta.finalproject.jh.vo.SellerBigcategoryVo;
import com.jhta.finalproject.jh.vo.SellerSmallcategoryVo;

@Controller
public class SellerPopupController {
	@Autowired
	private SellerInsertService service;
	@RequestMapping("/seller/popup")
	public String showPop(Model model) {
		List<SellerBigcategoryVo> list=service.getBigcate();
		model.addAttribute("list", list);
		return "/jiho/regProct/catePop";
	}
	
	@RequestMapping("/seller/getSmallcate")
	public List<SellerSmallcategoryVo> getSmallcate(Model model,int bcatenum) {
		List<SellerSmallcategoryVo> list=service.getSmallcate(bcatenum);
		return list;
	}
}
