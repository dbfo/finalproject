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
	
	//��ٱ��� ����Ʈ ��� service
	public List<CartListVo> cartlist(HashMap<String, Object> map){
		return dao.cartlist(map);
	}
	//��ٱ��� �ϳ����� service
	public int deleteOne(int cartNum) {
		return dao.deleteOne(cartNum);
	}
	//��ٱ��� �������� service
	public int changeCount(HashMap<String, Object>map) {
		return dao.changeCount(map);
	}
	//��ٱ��� �����Ѱ� ���� service
	public int deleteSelected(HashMap<String, Object> map) {
		return dao.deleteSelected(map);
	}
}
