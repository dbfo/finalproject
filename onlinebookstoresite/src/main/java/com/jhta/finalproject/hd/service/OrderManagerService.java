package com.jhta.finalproject.hd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.finalproject.hd.dao.OrderManagerDao;
import com.jhta.finalproject.hd.vo.refundBookVo;

@Service
public class OrderManagerService {
	@Autowired
	private OrderManagerDao dao;
	
	//주문상태인거 주문취소.
	public int orderCancel(HashMap<String,Object>map) {
		return dao.orderCancel(map);
	}
	
	//그외상태에서 반품신청/교환신청
	@Transactional
	public int orderapply(HashMap<String, Object>map) throws Exception{
		dao.orderCancel(map);
		List<refundBookVo>list=(ArrayList<refundBookVo>)map.get("list");
		for(refundBookVo vo:list) {
			int bcount=vo.getBcount();
			int bnum=vo.getBnum();
			System.out.println("서비스안 : "+bnum);
			System.out.println("서비스안 : "+bcount);
			map.put("bcount", bcount);
			map.put("bnum", bnum);
			dao.inputrefund(map);
		}
		return 1;
		
	}
	
	public List<refundBookVo> getpaymentbook(HashMap<String, Object> map) {
		return dao.getpaymentbook(map);
	}
}
