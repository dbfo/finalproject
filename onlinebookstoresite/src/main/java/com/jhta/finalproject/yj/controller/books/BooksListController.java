package com.jhta.finalproject.yj.controller.books;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.yj.service.BooksImgService;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;
import com.jhta.finalproject.yj.vo.PageUtil;

@Controller
public class BooksListController {
	@Autowired
	private BooksImgService service;

	@RequestMapping("/booksList")
	public ModelAndView showList(
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			String infoField, String infoKeyword, 
			String priceKeyword1,
			@RequestParam(value = "priceKeyword2", defaultValue = "0") String priceKeyword2, 
			String countKeyword1,
			@RequestParam(value = "countKeyword2", defaultValue = "0") String countKeyword2, 
			String dateKeyword1, 
			@RequestParam(value = "dateKeyword2", defaultValue = "0") String dateKeyword2) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		if (priceKeyword2.equals("0")) {
			priceKeyword2 = priceKeyword1;
		}
		
		if (countKeyword2.equals("0")) {
			countKeyword2 = countKeyword1;
		}
		
		if (dateKeyword2.equals("0")) {
			dateKeyword2 = dateKeyword1;
		}
		map.put("infoField", infoField);
		map.put("infoKeyword", infoKeyword);
		map.put("priceKeyword1", priceKeyword1);
		map.put("priceKeyword2", priceKeyword2);
		map.put("countKeyword1", countKeyword1);
		map.put("countKeyword2", countKeyword2);
		map.put("dateKeyword1", dateKeyword1);
		map.put("dateKeyword2", dateKeyword2);
		
		int totalRowCnt = service.count(map); // 전체 글의 개수
		PageUtil pu = new PageUtil(pageNum, totalRowCnt, 20, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		ModelAndView mv = new ModelAndView();
		List<BooksVO> list = service.list(map);
		mv.addObject("list", list);
		mv.addObject("infoField", infoField);
		mv.addObject("infoKeyword", infoKeyword);
		mv.addObject("priceKeyword1", priceKeyword1);
		mv.addObject("priceKeyword2", priceKeyword2);
		mv.addObject("countKeyword1", countKeyword1);
		mv.addObject("countKeyword2", countKeyword2);
		mv.addObject("dateKeyword1", dateKeyword1);
		mv.addObject("dateKeyword2", dateKeyword2);
		mv.addObject("pu", pu);

		mv.setViewName(".booksList");
		return mv;
	}

	@RequestMapping("/preview")
	public String preview(int bnum, Model model) {
		BooksVO vo = service.getBooksInfo(bnum);
		String bcontent = vo.getBcontent();
		if (bcontent != null) {
			bcontent = bcontent.replace("\n", "<br>");
		}
		vo.setBcontent(bcontent);

		List<ImgVO> imgList = service.getImgInfo(bnum);

		if (imgList.size() == 2) { // 만약에 이미지가 두개일 경우
			model.addAttribute("imgVO2", imgList.get(1)); //일반 이미지
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("imgVO1", imgList.get(0)); //썸네일
		return ".booksPreview";
	}
}
