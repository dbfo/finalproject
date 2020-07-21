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
import com.jhta.finalproject.yj.vo.PageUtil;

@Controller
public class MembersListController {
	@Autowired
	private MembersService service;

	// 일반회원
	@RequestMapping("/membersList")
	public ModelAndView memList(
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			String infoField, String infoKeyword, 
			String ageKeyword1,
			@RequestParam(value = "ageKeyword2", defaultValue = "0") String ageKeyword2, 
			String dateKeyword1, 
			@RequestParam(value = "dateKeyword2", defaultValue = "0") String dateKeyword2) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (ageKeyword2.equals("0")) {
			ageKeyword2 = ageKeyword1;
		}
		
		if (dateKeyword2.equals("0")) {
			dateKeyword2 = dateKeyword1;
		}

		map.put("infoField", infoField);
		map.put("infoKeyword", infoKeyword);
		map.put("ageKeyword1", ageKeyword1);
		map.put("ageKeyword2", ageKeyword2);
		map.put("dateKeyword1", dateKeyword1);
		map.put("dateKeyword2", dateKeyword2);
		
		int totalRowCnt = service.memCount(map); // 전체 글의 개수
		PageUtil pu = new PageUtil(pageNum, totalRowCnt, 20, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		ModelAndView mv = new ModelAndView();
		List<MembersListVO> list = service.memList(map);
		mv.addObject("list", list);
		mv.addObject("infoField", infoField);
		mv.addObject("infoKeyword", infoKeyword);
		mv.addObject("ageKeyword1", ageKeyword1);
		mv.addObject("ageKeyword2", ageKeyword2);
		mv.addObject("dateKeyword1", dateKeyword1);
		mv.addObject("dateKeyword2", dateKeyword2);
		mv.addObject("pu", pu);
		mv.setViewName(".membersList");
		return mv;
	}

	// 탈퇴회원
	@RequestMapping("/ghostList")
	public ModelAndView ghostList(
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			String infoField, String infoKeyword, 
			String ageKeyword1,
			@RequestParam(value = "ageKeyword2", defaultValue = "0") String ageKeyword2, 
			String dateKeyword1, 
			@RequestParam(value = "dateKeyword2", defaultValue = "0") String dateKeyword2) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (ageKeyword2.equals("0")) {
			ageKeyword2 = ageKeyword1;
		}
		
		if (dateKeyword2.equals("0")) {
			dateKeyword2 = dateKeyword1;
		}

		map.put("infoField", infoField);
		map.put("infoKeyword", infoKeyword);
		map.put("ageKeyword1", ageKeyword1);
		map.put("ageKeyword2", ageKeyword2);
		map.put("dateKeyword1", dateKeyword1);
		map.put("dateKeyword2", dateKeyword2);
		
		int totalRowCnt = service.ghostCount(map); // 전체 글의 개수
		PageUtil pu = new PageUtil(pageNum, totalRowCnt, 20, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		ModelAndView mv = new ModelAndView();
		List<MembersListVO> list = service.ghostList(map);
		mv.addObject("list", list);
		mv.addObject("infoField", infoField);
		mv.addObject("infoKeyword", infoKeyword);
		mv.addObject("ageKeyword1", ageKeyword1);
		mv.addObject("ageKeyword2", ageKeyword2);
		mv.addObject("dateKeyword1", dateKeyword1);
		mv.addObject("dateKeyword2", dateKeyword2);
		mv.addObject("pu", pu);
		
		mv.setViewName(".ghostList");
		return mv;
	}
}
