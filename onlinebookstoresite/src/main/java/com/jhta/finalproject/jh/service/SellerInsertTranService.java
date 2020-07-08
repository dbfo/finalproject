package com.jhta.finalproject.jh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jh.dao.SellerInsertDao;

@Service
public class SellerInsertTranService {
	@Autowired
	private SellerInsertDao dao;
	
	/*
	public int sellerInsertProd() {
		
		//썸네일만 있을 경우
		dao.insertProd(vo);
		dao.insertObimgThum(vo);
		
		//썸네일+추가이미지 있을 경우
		dao.insertProd(vo);
		dao.insertObimgThum(vo);
		dao.insertObimg(vo);
		
		return 0;
	}*/
}
