package com.jhta.finalproject.yj.controller.members;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.yj.service.MembersService;
import com.jhta.finalproject.yj.vo.MembersListVO;

@Controller
public class MembersListController {
	@Autowired
	private MembersService service;

	// 일반회원
	@RequestMapping("/membersList")
	public ModelAndView memList(String infoField, String infoKeyword, String ageKeyword1,
			@RequestParam(value = "ageKeyword2", defaultValue = "0") String ageKeyword2, String dateField,
			String dateKeyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (ageKeyword2.equals("0")) {
			ageKeyword2 = ageKeyword1;
		}

		map.put("infoField", infoField);
		map.put("infoKeyword", infoKeyword);
		map.put("ageKeyword1", ageKeyword1);
		map.put("ageKeyword2", ageKeyword2);
		
		map.put("dateField", dateField);
		map.put("dateKeyword", dateKeyword);
		
//		System.out.println("dateField1:"+dateField);
//		System.out.println("dateKeyword1:"+dateKeyword);
		
		ModelAndView mv = new ModelAndView();
		List<MembersListVO> list = service.memList(map);
		mv.addObject("list", list);
		mv.addObject("infoField", infoField);
		mv.addObject("infoKeyword", infoKeyword);
		mv.addObject("ageKeyword1", ageKeyword1);
		mv.addObject("ageKeyword2", ageKeyword2);
		
		mv.addObject("dateField", dateField);
		mv.addObject("dateKeyword", dateKeyword);
		
//		System.out.println("dateField2:"+dateField);
//		System.out.println("dateKeyword2:"+dateKeyword);
		mv.setViewName(".membersList");
		return mv;
	}

	// 탈퇴회원
	@RequestMapping("/ghostList")
	public ModelAndView ghostList() {
		ModelAndView mv = new ModelAndView();
		List<MembersListVO> list = service.ghostList();
		mv.addObject("list", list);
		mv.setViewName(".ghostList");
		return mv;
	}
}
