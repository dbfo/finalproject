package com.jhta.finalproject.yj.controller.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.yj.service.QnaService;
import com.jhta.finalproject.yj.vo.QnaVO;

@Controller
public class QnaListController {
	@Autowired
	private QnaService service;

	// 미답변 리스트
	@RequestMapping("/qnaList")
	public ModelAndView unAnswerList() {
		ModelAndView mv = new ModelAndView();
		List<QnaVO> list = service.unAnswerList();
		mv.addObject("list", list);
		mv.setViewName(".qnaList");
		return mv;
	}
}
