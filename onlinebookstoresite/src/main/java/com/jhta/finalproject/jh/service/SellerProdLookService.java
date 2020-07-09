package com.jhta.finalproject.jh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jh.dao.SellerProdLookDao;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;

@Service
public class SellerProdLookService {
	@Autowired
	private SellerProdLookDao dao;
	
	public List<SellerOldbooksVo> allList(int snum){
		List<SellerOldbooksVo> list=dao.allList(snum);
		return list;
	}
}
