package com.jhta.finalproject.jm.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.jm.service.BooksService;
import com.jhta.finalproject.jm.vo.BigcateVo;
import com.jhta.finalproject.jm.vo.BooksVo;
import com.jhta.page.util.PageUtil;

@Controller
public class ListController {
	@Autowired
	private BooksService service;

	//전체 리스트
	@GetMapping(value = "list1")
	// 파라미터가 pageNum으로 넘어오지않으면 기본값(defaultValue)를 1로 줘라~
	public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 검색조건 Map에 담기
		map.put("field", field);
		map.put("keyword", keyword);

		
		

		ModelAndView mv = new ModelAndView(".list1");
		int totalRowCount = service.count(map);// 전체글의 갯수
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 10);

		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BooksVo> list = service.list(map);
		List<BigcateVo> list2=service.list2();
		mv.addObject("list", list);
	
		mv.addObject("list2", list2);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);
		
		return mv;
	}
	
	// 베스트셀러 리스트..(bhit 기준)
	@GetMapping(value = "list2")
	// 파라미터가 pageNum으로 넘어오지않으면 기본값(defaultValue)를 1로 줘라~
	public ModelAndView bestlist(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 검색조건 Map에 담기
		map.put("field", field);
		map.put("keyword", keyword);

		ModelAndView mv = new ModelAndView(".list2");
		int totalRowCount = service.count(map);// 전체글의 갯수
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 10);
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BooksVo> bestlist = service.bestlist(map);
		List<BigcateVo> list2=service.list2();
		mv.addObject("bestlist", bestlist);
		
		mv.addObject("list2", list2);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);
		
		return mv;
	}
	
	// 검색했을때 리스트
	@PostMapping(value = "/sbooklist")
	public ModelAndView sbooklist(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword ,@RequestParam(value = "bcate2", defaultValue = "0")int bcate2,
			@RequestParam(value = "scate2", defaultValue = "0")int scate2) {
		System.out.println("scate:" + scate2);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ModelAndView mv = new ModelAndView(".list1");
		map.put("field", scate2);
		map.put("keyword", keyword);
		System.out.println(field);
		System.out.println(keyword);
		int totalRowCount = service.count(map);// 전체글의 갯수
		
		if(field==null) { totalRowCount = 0; }
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 10);
		// 검색조건 Map에 담기
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("bcatenum", bcate2);
		map.put("scatenum", scate2);
		
		List<BooksVo> sbooklist=service.sbooklist(map);
		List<BigcateVo> list2=service.list2();
			
		System.out.println(map.get(field));
		System.out.println(map.get(keyword));

		mv.addObject("list", sbooklist);
		mv.addObject("list2", list2);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);
		return mv;
	}
	
}
