package com.jhta.finalproject.jh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.jh.vo.SellerImgVo;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;

@Repository
public class SellerProdLookDao {
	@Autowired
	private SqlSessionTemplate slqSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.SellerProdLookMapper.jh";
	
	//전체 등록한 상품 조회
	public List<SellerOldbooksVo> allList(int snum){
		List<SellerOldbooksVo> list=slqSession.selectList(NAMESPACE+".prodAllSelect", snum);
		return list;
	}
	
	//상품 수정을 위한 조회
	public List<SellerOldbooksVo> prodUpdateSelect(int obnum){
		List<SellerOldbooksVo> list=slqSession.selectList(NAMESPACE+".prodUpdateSelect", obnum);
		return list;
	}
	
	//상품수정을 위한 큰 카테고리 넘버 가져오기
	public int getBiccatenum(int obnum){
		return slqSession.selectOne(NAMESPACE+".updateGetBigcatenum", obnum);
	}
	
	//상품수정을 위한 이미지 리스트 가져오기
	public List<SellerImgVo> getProdImgList(int obnum){
		List<SellerImgVo> list=slqSession.selectList(NAMESPACE+".getProdImg", obnum);
		return list;
	}
	
	//상품수정 메소드
	public int updateOldBooks(SellerOldbooksVo vo) {
		return slqSession.update(NAMESPACE+".updateProdinfo", vo);
	}
	
	//이미지삭제 메소드
	public int delimg(int imgnum) {
		return slqSession.delete(NAMESPACE+".deleteImg", imgnum);
	}
	
	//삭제할 이미지 정보 가져오기
	public SellerImgVo getdelImginfo(int imgnum) {
		SellerImgVo vo=slqSession.selectOne(NAMESPACE+".getImginfo", imgnum);
		return vo;
	}
	
	//중고책 수정이미지 등록
	public int updateImg(SellerImgVo vo) {
		return slqSession.insert(NAMESPACE+".updateImg", vo);
	}
	//---------------------중고책 삭제관련------------------
	//중고책 상품 삭제하기
	public int oldbookDel(int obnum) {
		return slqSession.delete(NAMESPACE+".oldbookDel", obnum);
	}
	//중고책 상품 이미지 삭제
	public int oldbookImgDel(int obnum) {
		return slqSession.delete(NAMESPACE+".oldbookImgDel", obnum);
	}
	//삭제할 중고책 이미지 가져오기
	public List<SellerImgVo> delImglist(int obnum){
		List<SellerImgVo> list=slqSession.selectList(NAMESPACE+".delImgInfo", obnum);
		return list;
	}
		
}
