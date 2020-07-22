package com.jhta.finalproject.yj.controller.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.finalproject.yj.service.QnaAnswerTranService;
import com.jhta.finalproject.yj.vo.QnaAnswerVO;
import com.jhta.finalproject.yj.vo.QnaVO;

@Controller
public class QnaAnswerInsertController {
	@Autowired
	private QnaAnswerTranService service;

	@PostMapping("/qnaAnswerInsert")
	public String insertOk(QnaAnswerVO avo, QnaVO qvo) {
		int n = service.answerInsertUpdate(avo, qvo);
		if (n > 0) {
			return "/admin/success";
		} else {
			return "/admin/fail";
		}
	}
}
