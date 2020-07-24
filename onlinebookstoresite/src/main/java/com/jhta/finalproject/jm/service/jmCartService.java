package com.jhta.finalproject.jm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jm.dao.jmCartDao;
import com.jhta.finalproject.jm.vo.CartVo;

@Service
public class jmCartService {
	@Autowired private jmCartDao dao;
	
	public int cartinsert(CartVo vo) {
		return dao.cartinsert(vo);
	}
}
