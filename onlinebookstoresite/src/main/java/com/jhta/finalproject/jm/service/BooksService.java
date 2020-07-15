package com.jhta.finalproject.jm.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jm.dao.BooksDao;
import com.jhta.finalproject.jm.vo.BigcateVo;
import com.jhta.finalproject.jm.vo.BooksVo;

@Service
public class BooksService {
	@Autowired
	private BooksDao dao;

	public int count(HashMap<String, Object>map) {
		return dao.count(map);
	}
	public int breviewcount(int bnum) {
		return dao.breviewcount(bnum);
	}
	
	public int sbooklist1count(HashMap<String, Object> map) {
		return dao.sbooklist1count(map);
	}
	public int novelcount(HashMap<String, Object> map) {
		return dao.novelcount(map);
	}
	public int poetrycount(HashMap<String, Object> map) {
		return dao.poetrycount(map);
	}
	
	public List<BooksVo> list(HashMap<String, Object> map){
		return dao.list(map);
	}
	public List<BooksVo> bestlist(HashMap<String, Object> map){
		return dao.bestlist(map);
	}
	public List<BigcateVo> list2(){
		return dao.list2();
	}
	public BooksVo detail (int num) {
		return dao.detail(num);
	}

	public int addHit(int num) {
		return dao.addHit(num);
	}
	public List<BooksVo> bbooklist(int num) {
		return dao.bbooklist(num);
	}
	public List<BooksVo> sbooklist(int num) {
		return dao.sbooklist(num);
	}
	public List<BooksVo> sbooklist1(HashMap<String,Object> map) {
		return dao.sbooklist1(map);
	}
	public List<BooksVo> newlist(HashMap<String, Object> map){
		return dao.newlist(map);
	}
	
	public List<BooksVo> catenovel(HashMap<String, Object> map){
		return dao.catenovel(map);
	}
	public List<BooksVo> catepoetry(HashMap<String, Object> map){
		return dao.catepoetry(map);
	}

}
