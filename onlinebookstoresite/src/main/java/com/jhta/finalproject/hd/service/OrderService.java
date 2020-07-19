package com.jhta.finalproject.hd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.finalproject.hd.dao.OrderDao;
import com.jhta.finalproject.hd.vo.OrderListResultVo;
import com.jhta.finalproject.hd.vo.ShipmentInfoVo;
import com.jhta.finalproject.hd.vo.UsedOrderListVo;

@Service
public class OrderService {

	@Autowired
	private OrderDao dao;
	
	// 주문완료 트랜잭션 //
	@Transactional
	public int ordercomplete(Map<String, Object>map){
		dao.bpayment_card(map);
		int bpayNum=dao.getbpayNum();
		String [] bnum=(String [])map.get("bnum");
		String [] bcount=(String [])map.get("bcount");
		String [] point=(String [] )map.get("point");
		
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map.put("bpaynum", bpayNum);
		map1.put("bpaynum", bpayNum);
		for(int i=0;i<bnum.length;i++) {
			map1.put("bnum", bnum[i]);
			int orgbcount=dao.books_bcount(map1); //현재 테이블에서 수량 구하기.
			int orderbcount=Integer.parseInt(bcount[i]);//주문한수량.
			int changebcount=orgbcount-orderbcount;
			map1.put("bcount",bcount[i]);
			map1.put("changebcount",changebcount);
			map1.put("point",point[i]);
			dao.paymentbook(map1); // paymentbook 테이블에 데이터추가.
			dao.change_count(map1);
		}
		if((int)map.get("mnum")!=0) {
			int usedpoint=(int)map.get("usepoint")*(-1);
			map.put("usedpoint", usedpoint);
			dao.use_point(map);
			dao.point_plus(map);
		}
		if(map.get("cartNum")!=null) {
			
				
			
		}
		return bpayNum;
	}
	
	// 주문완료 트랜잭션 끝 //
	
	public List<OrderListResultVo> inputorderlist(Map<String, Object>map){
		return dao.inputorderlist(map);
	}
	public OrderListResultVo directorder(int bnum) {
		return dao.directOrder(bnum);
	}
	public ShipmentInfoVo getAddr(int mnum) {
		return dao.getAddr(mnum);
	}
	public int getPoint(int mnum) {
		return dao.getPoint(mnum);
	}
	public List<UsedOrderListVo> usedorderlist(Map<String,Object>map){
		return dao.usedorderlist(map);
	}
	
}
