package com.jhta.finalproject.yj.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.dao.BooksDao;
import com.jhta.finalproject.yj.vo.BigCategoryVO;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;
import com.jhta.finalproject.yj.vo.SmallCategoryVO;

@Service
public class BooksService {
	@Autowired
	private BooksDao dao;

	public int booksInsert(BooksVO vo) {
		return dao.booksInsert(vo);
	}

	public int getBnum() {
		return dao.getBnum();
	}

	public int imgInsert(ImgVO vo) {
		return dao.imgInsert(vo);
	}
	
	public List<BigCategoryVO> getBigctg() {
		return dao.getBigctg();
	}

	public List<SmallCategoryVO> getSmallctg() {
		return dao.getSmallctg();
	}
	
	public List<BooksVO> list() {
		return dao.list();
	}
}
