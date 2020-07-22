package com.jhta.finalproject.yj.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.dao.QnaDao;
import com.jhta.finalproject.yj.vo.QnaVO;

@Service
public class QnaService {
	@Autowired
	private QnaDao dao;

	// 미답변
	public int unAnswerCount() {
		return dao.unAnswerCount();
	}

	public List<QnaVO> unAnswerList(HashMap<String, Object> map) {
		return dao.unAnswerList(map);
	}

	public QnaVO unAnswerInfo(int qnanum) {
		return dao.unAnswerInfo(qnanum);
	}

	// 답변완료
	public int answerCount() {
		return dao.answerCount();
	}

	public List<QnaVO> answerList(HashMap<String, Object> map) {
		return dao.answerList(map);
	}
}
