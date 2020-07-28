package com.jhta.finalproject.hd.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.hd.dao.MyPageDao;
import com.jhta.finalproject.hd.vo.HistoryListVo;
import com.jhta.finalproject.hd.vo.QnaHistoryVo;

@Service
public class MyPageService {
	@Autowired
	private MyPageDao dao;
	
	public List<HistoryListVo> orderhistory(HashMap<String, Object>map){
		return dao.orderhistory(map);
	}
	
	public HashMap<String,Object> confirmtype(int bpaynum) {
		return dao.confirmtype(bpaynum);
	}
	public int countPaymentBook(int bpaynum) {
		return dao.countPaymentBook(bpaynum);
	}
	
	public String newBtitle(int bnum) {
		return dao.newBtitle(bnum);
	}
	
	public HashMap<String, Object> usedBtitle(int bnum){
		return dao.usedBtilte(bnum);
	}
	public int countHistory(HashMap<String, Object>map) {
		return dao.countHistory(map);
	}
	public int countQnaHistory(HashMap<String,Object>map) {
		return dao.countQnaHistory(map);
	}
	public List<QnaHistoryVo> qnahistory(HashMap<String, Object>map){
		return dao.qnahistory(map);
	}
	public int qnawrite(HashMap<String, Object>map) {
		return dao.qnawrite(map);
	}
	
	//마이페이지 최근리스트 관련 서비스
	public List<HistoryListVo> recentorder(int mnum){
		return dao.recentorder(mnum);
	}
	public List<HistoryListVo> recentcancel(int mnum){
		return dao.recentcancel(mnum);
	}

}
