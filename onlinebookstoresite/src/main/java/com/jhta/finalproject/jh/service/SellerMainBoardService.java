package com.jhta.finalproject.jh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jh.dao.SellerMainBoardDao;

@Service
public class SellerMainBoardService {
	@Autowired
	private SellerMainBoardDao dao;
	
	//상황판 판매현황
	//상황판(최근 한달간 등록한 상품)
	public int getOldbookCount() {
		return dao.getOldbookCount();
	}
	//상황판 최근 한달간 판매현황(1:입금대기중 , 2:입금완료/배송요청,  3: 판매완료/구매확정) 
	public int getOldbookSalestatusCount(int salesStatus) {
		return dao.getOldbookSalestatusCount(salesStatus);
	}
}