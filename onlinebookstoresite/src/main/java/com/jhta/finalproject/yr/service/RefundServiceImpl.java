package com.jhta.finalproject.yr.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.finalproject.yr.dao.DepositDao;

@Service
public class RefundServiceImpl implements RefundService{

	@Autowired
	private DepositDao dao;
	
	@Transactional
	@Override
	public int updateSestausAndDecreaseDeposit(List<Integer> senum, 
			List<Integer> mnum, List<Integer> priceArr) {
		
		for (Integer sn : senum) {
			dao.updateSestatus(sn);
		} 
		
		for (int i = 0; i < mnum.size(); i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("dtran", priceArr.get(i)*-1);
			map.put("mnum", mnum.get(i));
			
			dao.decreaseDeposit(map);
		}
		
		return 1;
	}
	
}
