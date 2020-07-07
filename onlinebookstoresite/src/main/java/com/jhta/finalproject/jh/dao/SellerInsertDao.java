package com.jhta.finalproject.jh.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.jh.vo.SellerBigcategoryVo;
import com.jhta.finalproject.jh.vo.SellerImgVo;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;
import com.jhta.finalproject.jh.vo.SellerSmallcategoryVo;

@Repository
public class SellerInsertDao {
	@Autowired
	private SqlSessionTemplate slqSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.OldbooksMapper.jh";
	//큰 카테고리 가져오기
	public List<SellerBigcategoryVo> getBigcate(){
		List<SellerBigcategoryVo> list=slqSession.selectList(NAMESPACE+".getBigcate");
		return list;
	}
	//작은 카테고리 가져오기
	public List<SellerSmallcategoryVo> getSmallcate(int bcatenum){
		List<SellerSmallcategoryVo> list=slqSession.selectList(NAMESPACE+".getSmallcate", bcatenum);
		return list;
	}
	//중고책상품 등록
	public int insertProd(SellerOldbooksVo vo) {
		int n=slqSession.insert(NAMESPACE+".insertProd", vo);
		return n;
	}
	//이미지 등록을 위한 중고책 번호 얻어오기
	public int getObnum() {
		int obnum=slqSession.selectOne(NAMESPACE+".getObnum");
		return obnum;
	}
	
	//중고책 상품등록시 썸네일 이미지 등록
	public int insertObimgThum(SellerImgVo vo) {
		int n=slqSession.insert(NAMESPACE+".insertObimgThum", vo);
		return n;
	}
	
	//중고책 상품등록시 일반 이미지 등록
	public int insertObimg(SellerImgVo vo) {
		int n=slqSession.insert(NAMESPACE+".insertObimg", vo);
		return n;
	}
}
