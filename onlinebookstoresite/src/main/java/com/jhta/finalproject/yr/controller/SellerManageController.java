package com.jhta.finalproject.yr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerManageController {
	@RequestMapping("/admin/seller")
	public String goSellerManage() {
		return ".usedbookseller";
	}
}
