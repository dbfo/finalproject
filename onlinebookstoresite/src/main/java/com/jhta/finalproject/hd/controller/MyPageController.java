package com.jhta.finalproject.hd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	@RequestMapping("/mypage/main")
	public String conMyPage() {
		return ".mypage";
	}
}
