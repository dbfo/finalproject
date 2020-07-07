package com.jhta.finalproject.jh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jh.service.SellerInsertService;
import com.jhta.finalproject.jh.vo.SellerSmallcategoryVo;

@Controller
public class SellerGetsmallcateController {
	@Autowired
	private SellerInsertService service;
	@RequestMapping("/seller/getSmallcate")
	@ResponseBody
	public List<SellerSmallcategoryVo> getSmallcate(int bcatenum) {
		List<SellerSmallcategoryVo> list= service.getSmallcate(bcatenum);
		return list;
	}
}
