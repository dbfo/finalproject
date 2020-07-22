package com.jhta.finalproject.yj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.finalproject.yj.dao.QnaAnswerDao;
import com.jhta.finalproject.yj.dao.QnaDao;
import com.jhta.finalproject.yj.vo.QnaAnswerVO;
import com.jhta.finalproject.yj.vo.QnaVO;

@Service
public class QnaAnswerTranImpl implements QnaAnswerTranService {
	@Autowired
	private QnaAnswerDao adao;
	@Autowired
	private QnaDao qdao;

	@Transactional
	@Override
	public int answerInsertUpdate(QnaAnswerVO avo, QnaVO qvo) {
		adao.qnaAnswerInsert(avo);
		qdao.qnastatusUpdate(qvo);
		return 1;
	}
}
