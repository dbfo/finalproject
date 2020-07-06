package com.jhta.finalproject.jh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jh.dao.SellerInsertDao;
import com.jhta.finalproject.jh.vo.SellerBigcategoryVo;
import com.jhta.finalproject.jh.vo.SellerSmallcategoryVo;

@Service
public class SellerInsertService {
	@Autowired
	private SellerInsertDao dao;
	
	public List<SellerBigcategoryVo> getBigcate(){
		List<SellerBigcategoryVo> list=dao.getBigcate();
		return list;
	}
}
