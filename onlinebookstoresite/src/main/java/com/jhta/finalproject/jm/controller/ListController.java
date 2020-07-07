package com.jhta.finalproject.jm.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping(value = "list1", method = RequestMethod.GET)
	// 파라미터가 pageNum으로 넘어오지않으면 기본값(defaultValue)를 1로 줘라~
	public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword) {
		System.out.println(keyword);
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

}
