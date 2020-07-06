package com.jhta.finalproject.yj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.dao.BooksDao;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;

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
}
