package com.jhta.finalproject.hd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.hd.dao.OrderDao;
import com.jhta.finalproject.hd.vo.OrderListResultVo;
import com.jhta.finalproject.hd.vo.ShipmentInfoVo;
import com.jhta.finalproject.hd.vo.UsedOrderListVo;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;
	
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
