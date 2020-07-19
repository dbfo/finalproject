package com.jhta.finalproject.yr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.finalproject.yr.dao.ShipManageDao;
import com.jhta.finalproject.yr.vo.PointVo;

@Service
public class OrderFirstStepServiceImpl implements OrderFirstStepService{

	@Autowired
	private ShipManageDao dao;
	
	@Transactional
	@Override
	public int plusPointAndUpdateStatus(List<Integer> bpaynumList) {
		dao.updateBeforeToPreparing(bpaynumList);

		for (Integer bnum : bpaynumList) {
			int point = dao.getBookPoint(bnum);
			int mnum = dao.getMnum(bnum);
			PointVo pv = new PointVo(mnum, bnum, point, null);
			
			dao.pointPlus(pv);
		}
		
		return 1;
	}
	
}
