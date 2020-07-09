package com.jhta.finalproject.yj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.dao.BooksDao;
import com.jhta.finalproject.yj.vo.BigCategoryVO;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.SmallCategoryVO;

@Service
public class BooksService {
	@Autowired
	private BooksDao dao;
	
	public List<BigCategoryVO> getBigctg() {
		return dao.getBigctg();
	}

	public List<SmallCategoryVO> getSmallctg(int bcatenum) {
		return dao.getSmallctg(bcatenum);
	}
	
	public List<BooksVO> list() {
		return dao.list();
	}
}
