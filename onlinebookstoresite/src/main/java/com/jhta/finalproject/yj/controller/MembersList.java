package com.jhta.finalproject.yj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MembersList {
	@Autowired
	@GetMapping("/membersList")
	public String list() {
		return ".membersList";
	}
}

