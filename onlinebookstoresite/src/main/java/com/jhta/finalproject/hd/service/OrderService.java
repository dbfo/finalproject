package com.jhta.finalproject.hd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.hd.dao.OrderDao;
import com.jhta.finalproject.hd.vo.OrderResultVo;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;
	
	public List<OrderResultVo> inputorderlist(Map<String, Object>map){
		return dao.inputorderlist(map);
	}
	public String getAddr(int mnum) {
		return dao.getAddr(mnum);
	}
	public int getPoint(int mnum) {
		return dao.getPoint(mnum);
	}
}
