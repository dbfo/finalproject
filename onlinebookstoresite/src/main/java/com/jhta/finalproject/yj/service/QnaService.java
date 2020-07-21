package com.jhta.finalproject.yj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.dao.QnaDao;
import com.jhta.finalproject.yj.vo.QnaVO;

@Service
public class QnaService {
	@Autowired
	private QnaDao dao;
	
	public List<QnaVO> unAnswerList() {
		return dao.unAnswerList();
	}
}
