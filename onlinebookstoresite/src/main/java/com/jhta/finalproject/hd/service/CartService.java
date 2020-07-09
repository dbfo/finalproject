package com.jhta.finalproject.hd.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.hd.dao.CartDao;
import com.jhta.finalproject.hd.vo.CartListVo;

@Service
public class CartService {
	
	@Autowired
	private CartDao dao;
	public List<CartListVo> cartlist(HashMap<String, Object> map){
		return dao.cartlist(map);
	}
}
