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
	public HashMap<String, Object> ordercomplete(Map<String, Object>map){
		String [] bnum=(String [])map.get("bnum");
		String [] bcount=(String [])map.get("bcount");
		String [] point=(String [] )map.get("point");
		String method=(String)map.get("method");
		dao.bpayment(map);
		int bpayNum=dao.getbpayNum();
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
			dao.change_count(map1); //book테이블 수량변경 
		}
		if((int)map.get("mnum")!=0) {
			int usedpoint=(int)map.get("usepoint")*(-1);
			map.put("usedpoint", usedpoint);
			dao.use_point(map); //포인트 사용내역 insert
			if(method.equals("vbank")) { //가상계좌의경우 결제완료될때 포인트적립이되야하므로...
				dao.point_plus(map); //적립포인트 +
			}
		}
		if(map.get("cartNum")!=null) { //카트번호 배열이 존재할경우..(장바구니에서부터 주문한경우)
			dao.delete_cart(map);	   //장바구니에서도 삭제해주어야함.
		}
		if(method.equals("vbank")) { //가상계좌방식의 경우.
			dao.vbank(map);
		}
		HashMap<String,Object> resultmap=new HashMap<String, Object>();
		resultmap.put("bpaynum",bpayNum);
		return resultmap;
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
