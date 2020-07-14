package com.jhta.finalproject.jh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jh.dao.SellerMainBoardDao;

@Service
public class SellerMainBoardService {
	@Autowired
	private SellerMainBoardDao dao;
	//상황판(최근 한달간 등록한 상품)
	public int getOldbookCount() {
		return dao.getOldbookCount();
	}
}
