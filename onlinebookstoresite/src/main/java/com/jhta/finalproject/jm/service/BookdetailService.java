package com.jhta.finalproject.jm.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jm.dao.BookdetailDao;
import com.jhta.finalproject.jm.vo.BooksVo;

@Service
public class BookdetailService {
	@Autowired
	private BookdetailDao dao;
	
	public BooksVo bookdetail(int bnum){
		return dao.bookdetail(bnum);
	}
	public int addHit(int bnum) {
		return dao.addHit(bnum);
	}
}
