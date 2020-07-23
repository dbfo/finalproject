package com.jhta.finalproject.yr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yr.dao.SalesDao;

@Service
public class SalesService {
	@Autowired
	private SalesDao dao;
	
	public List<HashMap<String, String>> getList(HashMap<String,Object> map){
		return dao.getList(map);
	}
}
