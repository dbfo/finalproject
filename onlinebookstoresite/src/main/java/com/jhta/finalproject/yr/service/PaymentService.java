package com.jhta.finalproject.yr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yr.dao.PaymentDao;
import com.jhta.finalproject.yr.vo.PaymentVo;

@Service
public class PaymentService {
	
	@Autowired
	public PaymentDao dao;
	
	public List<PaymentVo> allList(){
		return dao.allList();
	}
}
