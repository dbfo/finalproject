package com.jhta.finalproject.yr.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.yr.service.CSManageService;

@Controller
public class CSMenuController {
	
	@Autowired	
	private CSManageService service;
	
	@RequestMapping("/cs/menu")
	public String goCSMenu(Model model, String PageName) {
		
		//상단 cs 갯수 상황판
		List<HashMap<String, Object>> CSCount = service.getCSCount();
		
		model.addAttribute("countList", CSCount);
		
		if(PageName.equals("0")) { //입금 전 취소
			model.addAttribute("checked","tab2");
			model.addAttribute("path",1);		
			return ".cs.cancel";
		}else if(PageName.equals("1")) { //취소
			model.addAttribute("checked","tab1");
			model.addAttribute("path",1);		
			return ".cs.cancel";
		}else if(PageName.equals("2")) { //반품
			model.addAttribute("path",2);		
			return ".cs.return";
		}else if(PageName.equals("3")) { //교환
			model.addAttribute("path",3);		
			return ".cs.exchange";		
		}
		
		return "/admin/error";
	}
}
