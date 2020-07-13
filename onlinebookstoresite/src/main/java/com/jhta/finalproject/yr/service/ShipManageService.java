package com.jhta.finalproject.yr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yr.dao.ShipManageDao;

@Service
public class ShipManageService {

	@Autowired
	private ShipManageDao dao;
	
	public List<Integer> getShipCount(){
		return dao.getShipCount();
	}
	
	public int updateBeforeToPreparing(List<Integer> list) {
		return dao.updateBeforeToPreparing(list);
	}
}	
