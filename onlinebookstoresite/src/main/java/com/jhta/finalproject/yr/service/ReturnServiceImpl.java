package com.jhta.finalproject.yr.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.finalproject.yr.dao.CSManageDao;
import com.jhta.finalproject.yr.dao.ReturnDao;
import com.jhta.finalproject.yr.vo.DepositVo;
import com.jhta.finalproject.yr.vo.PointVo;

@Service
public class ReturnServiceImpl implements ReturnService{

	@Autowired
	private CSManageDao dao;
	
	@Autowired
	private ReturnDao rdao;
	
	@Transactional
	@Override
	public int updateStatus(String status, String[] paymentbookNum,PointVo pointvo, DepositVo depositvo, HashMap<String, Object> map) {
		int n1 = 0;
		
		for (String bookNum : paymentbookNum) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("status", status);
			hmap.put("paymentbook_num", bookNum);
			
			n1 = dao.updateStatus(hmap);
			System.out.println("n1 : " + n1);
		}
		
		int n2 = rdao.pointReturn(pointvo);
		System.out.println("n2 : " + n2);
		int n3 = rdao.giveDeposit(depositvo);
		System.out.println("n3 : " + n3);
        for(String key : map.keySet()){
            System.out.println("키 : " + key);
            System.out.println("value : " + map.get(key));
        }
		int n4 = rdao.updatePayment(map);
		System.out.println("n4 : " + n4);
		
		
		
		return 1;
	}
	
	
	@Override
	public int getMnum(int bpaynum) {
		return rdao.getMnum(bpaynum);
	}
}
