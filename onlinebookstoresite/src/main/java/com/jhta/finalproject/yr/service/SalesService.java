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
	
	public List<HashMap<String, String>> mothList(HashMap<String,Object> map){
		return dao.mothList(map);
	}
	
	public List<HashMap<String, String>> weekList(HashMap<String,Object> map){
		return dao.weekList(map);
	}
	
	public List<HashMap<String, String>> usedbookgetList(HashMap<String,Object> map){
		return dao.usedbookgetList(map);
	}
	
	public List<HashMap<String, String>> usedbookmothList(HashMap<String,Object> map){
		return dao.usedbookmothList(map);
	}
	public List<HashMap<String, String>> usedbookweekList(HashMap<String,Object> map){
		return dao.usedbookweekList(map);
	}
}
