package com.jhta.finalproject.jm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.jm.service.BookdetailService;
import com.jhta.finalproject.jm.service.BooksService;
import com.jhta.finalproject.jm.vo.AllListVo;
import com.jhta.finalproject.jm.vo.BooksVo;
import com.jhta.finalproject.jm.vo.BreviewVo;
import com.jhta.page.util.PageUtil;

@Controller
public class BookdetailController {
	@Autowired
	private BookdetailService service;

//	@RequestMapping(value = "/bdetail", method = RequestMethod.GET)
	@GetMapping(value = "/bdetail")
	public ModelAndView detailtest(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			@RequestParam(value = "field", defaultValue = "")String field,
			@RequestParam(value = "keyword", defaultValue = "")String keyword,
			@RequestParam(value = "bnum", defaultValue = "0")int bnum)  {
		HashMap<String, Object> map = new HashMap<String, Object>();
		service.addHit(bnum);
		
		
		ModelAndView mv = new ModelAndView(".bdetail");
		int totalRowCount = service.breviewcount(bnum);// 리뷰 갯수
		
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 10);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("bnum",bnum);
		map.put("field",field);
		map.put("keyword",keyword);
		
		AllListVo bookvo=service.bookdetail(bnum);
		List<BreviewVo> reviewvo=service.reviewlist(map);
		
		
		mv.addObject("bookvo",bookvo);
		mv.addObject("reviewvo",reviewvo);
		mv.addObject("bnum",bnum);
		return mv;
	}
	
	@RequestMapping(value="/enrllReview", method =  RequestMethod.GET)
	public String enrollReview(@RequestParam(value = "reviewcontent", defaultValue = "0")String reviewcontent, 
								@RequestParam(value = "bscore", defaultValue = "0")int bscore,
								@RequestParam(value = "bnum", defaultValue = "0")int bnum) {
		//insert 할때 밑에 Vo가 필요하다, mapper에 쿼리문이 작성되어있기떄문에 해당 필요한 3가지 bnum,rc,bs 같은거만 입력해준다.
		BreviewVo vo=new BreviewVo(0, 4, bnum, reviewcontent, bscore, null);
		//↑↑↑↑ 2020-07-17 vo에 members 컬럼도 추가 했는데 아직 어떻게 인설트 처리를 할지 모르겠음.
		//집가서 좀더 고민해볼예정
		
		
		int reviewinsert = service.breviewinsert(vo);// 해당 vo를 result 값으로 받는다.
		
//		List<BreviewVo> list=service.reviewlist(map);

		
		return "";

	}
}

