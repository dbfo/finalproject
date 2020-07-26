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
	@Transactional
	public int orderCancel(HashMap<String,Object>map) {
		dao.orderCancel(map);
		List<refundBookVo>list=dao.getpaymentbook(map);
		for(refundBookVo vo:list) {
			HashMap<String, Object> bmap=new HashMap<String, Object>();
			bmap.put("bnum", vo.getBnum());
			int commBcount=dao.commonCount(bmap);
			int bcount=commBcount+vo.getBcount();
			bmap.put("bcount", bcount);
			dao.returnBookCount(bmap);
		}
		int usedpoint=dao.getUsedpoint(map);
		if(usedpoint>0) {
			map.put("point", usedpoint);
			dao.returnPoint(map);
		}
		return 1;
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
	//중고상품 구매확정 트랜잭션
	@Transactional
	public int confirmorder(HashMap<String, Object>map) throws Exception{
		dao.confirmold(map);
		dao.confirmBpayment(map);
		int fee=dao.getfee();
		int totalvalue=(int)map.get("totalvalue");
		int totalprice=(int)map.get("totalprice");
		int feepay=(totalvalue*(fee/100));
		System.out.println("수수료 떄간금액:"+feepay);
		int settlement=totalprice-feepay;
		int settlementB=totalvalue-feepay;
		System.out.println("수수료 제외한 금액:"+settlement);
		System.out.println("상품금액에서 수수료제외한금액ㅇ :"+settlementB);
		map.put("feeper", fee);
		map.put("feepay", feepay);
		map.put("settlement", settlement);
		map.put("fprice", totalprice);
		dao.insertComple(map);
		
		return 1;
	}
	//중고상품 취소
	@Transactional
	public int cancelUsedorder(HashMap<String, Object>map) throws Exception {
		dao.orderCancel(map);
		dao.cancelmold(map);
		int usedpoint=dao.getUsedpoint(map);
		if(usedpoint>0) {
			map.put("point", usedpoint);
			dao.returnPoint(map);
		}
		return 1;
	}
	
	public List<refundBookVo> getpaymentbook(HashMap<String, Object> map) {
		return dao.getpaymentbook(map);
	}
}
