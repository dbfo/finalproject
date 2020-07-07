package com.jhta.finalproject.jm.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jm.dao.BooksDao;
import com.jhta.finalproject.jm.vo.BigcateVo;
import com.jhta.finalproject.jm.vo.BooksVo;

@Service
public class BooksService {
	@Autowired
	private BooksDao dao;

	public int count(HashMap<String, Object>map) {
		return dao.count(map);
	}
	public List<BooksVo> list(HashMap<String, Object> map){
		return dao.list(map);
	}
	public List<BigcateVo> list2(){
		return dao.list2();
	}
	public BooksVo detail (int num) {
		return dao.detail(num);
	}

	public int addHit(int num) {
		return dao.addHit(num);
	}
	

}
