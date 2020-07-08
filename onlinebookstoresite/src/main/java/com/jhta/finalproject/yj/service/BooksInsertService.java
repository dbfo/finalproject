package com.jhta.finalproject.yj.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;

@Service
public interface BooksInsertService {
	int insert(BooksVO bvo, ImgVO ivo);
	int insertList(BooksVO bvo, ImgVO ivo1, ImgVO ivo2);
}
