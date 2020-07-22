package com.jhta.finalproject.yj.controller.qna;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.yj.service.QnaService;
import com.jhta.finalproject.yj.vo.PageUtil;
import com.jhta.finalproject.yj.vo.QnaVO;

@Controller
public class QnaListController {
	@Autowired
	private QnaService service;

	// 미답변 리스트_상태:0
	@RequestMapping("/unAnswerList")
	public ModelAndView unAnswerList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		int totalRowCnt = service.unAnswerCount(); // 전체글의 개수
		PageUtil pu = new PageUtil(pageNum, totalRowCnt, 20, 5);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		ModelAndView mv = new ModelAndView();
		List<QnaVO> list = service.unAnswerList(map);
		mv.addObject("list", list);
		mv.addObject("pu", pu);
		mv.setViewName(".unAnswerList");
		return mv;
	}

	// 답변 리스트_상태:1
	@RequestMapping("/answerList")
	public ModelAndView answerList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		int totalRowCnt = service.answerCount(); // 전체글의 개수
		PageUtil pu = new PageUtil(pageNum, totalRowCnt, 20, 5);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		ModelAndView mv = new ModelAndView();
		List<QnaVO> list = service.answerList(map);
		mv.addObject("list", list);
		mv.addObject("pu", pu);
		mv.setViewName(".answerList");
		return mv;
	}

	// 더보기
	@RequestMapping("/qnaDetail")
	public String qnaDetail(Model model, int qnanum) {
		QnaVO vo = service.unAnswerInfo(qnanum);
		String qnacontent = vo.getQnacontent();
		if (qnacontent != null) {
			qnacontent = qnacontent.replace("\n", "<br>");
		}
		vo.setQnacontent(qnacontent);
		model.addAttribute("vo", vo);
		return ".qnaDetail";
	}
}
