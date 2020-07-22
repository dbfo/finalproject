package com.jhta.finalproject.jh.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jh.dao.SellerBoardDao;
import com.jhta.finalproject.jh.vo.SellerObqanswerVo;
import com.jhta.finalproject.jh.vo.SellerQnaListJoinVo;

@Service
public class SellerBoardService implements SellerBoard{
	@Autowired
	private SellerBoardDao dao;
	
	
	//중고판매자 Qna리스트 가져오기
	public List<SellerQnaListJoinVo> getSellerQnaList(int snum){
		List<SellerQnaListJoinVo> list=dao.getSellerQnaList(snum);
		return list;
	}
	//중고판매자 답변 리스트 가져오기
	public List<SellerObqanswerVo> getSellerAnswerList(int snum){
		List<SellerObqanswerVo> list=dao.getSellerAnswerList(snum);
		return list;
	}
	//중고판매자 답변하기
	@Override
	public int sellerQnaInsert(HashMap<String, Object> map) {
		dao.updateQnastatus(map);
		dao.insertObqanswer(map);
		return 1;
	}
}
