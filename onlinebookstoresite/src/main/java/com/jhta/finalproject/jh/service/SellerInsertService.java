package com.jhta.finalproject.jh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jh.dao.SellerInsertDao;
import com.jhta.finalproject.jh.vo.SellerBigcategoryVo;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;
import com.jhta.finalproject.jh.vo.SellerSmallcategoryVo;

@Service
public class SellerInsertService {
	@Autowired
	private SellerInsertDao dao;
	
	//대분류 카테고리 가져오기
	public List<SellerBigcategoryVo> getBigcate(){
		List<SellerBigcategoryVo> list=dao.getBigcate();
		return list;
	}
	//소분류 카테고리 가져오기
	public List<SellerSmallcategoryVo> getSmallcate(int bcatenum){
		List<SellerSmallcategoryVo> list=dao.getSmallcate(bcatenum);
		return list;
	}
	//중고책등록
	public int insertProd(SellerOldbooksVo vo) {
		int n=dao.insertProd(vo);
		return n;
	}
}
