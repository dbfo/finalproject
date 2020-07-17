package com.jhta.finalproject.yr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yr.dao.CSManageDao;
import com.jhta.finalproject.yr.vo.PaymentAndBookListVo;
import com.jhta.finalproject.yr.vo.PaymentAndCSBookListVo;

@Service
public class CSManageService {

	@Autowired
	public CSManageDao dao;
	
	public List<HashMap<String,Object>> getCSCount(){
		return dao.getCSCount();
	}
	
	public List<PaymentAndCSBookListVo> paymentList(HashMap<String, Object> map){
		return dao.paymentList(map);
	}
}
