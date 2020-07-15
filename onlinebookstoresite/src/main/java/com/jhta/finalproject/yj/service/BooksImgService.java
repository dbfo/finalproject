package com.jhta.finalproject.yj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.dao.BooksDao;
import com.jhta.finalproject.yj.dao.ImgDao;
import com.jhta.finalproject.yj.vo.BigCategoryVO;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;
import com.jhta.finalproject.yj.vo.SmallCategoryVO;

@Service
public class BooksImgService {
	@Autowired
	private BooksDao bdao;
	@Autowired
	private ImgDao idao;

	public List<BigCategoryVO> getBigctg() {
		return bdao.getBigctg();
	}

	public List<SmallCategoryVO> getSmallctg(int bcatenum) {
		return bdao.getSmallctg(bcatenum);
	}

	public List<BooksVO> list() {
		return bdao.list();
	}

	public BooksVO preview(int bnum) {
		return bdao.preview(bnum);
	}

	public List<ImgVO> getImgInfo(int bnum) {
		return idao.getImgInfo(bnum);
	}

	public int booksDelete(int bnum) {
		return bdao.booksDelete(bnum);
	}

	public int imgDelete(int bnum) {
		return idao.imgDelete(bnum);
	}
}
