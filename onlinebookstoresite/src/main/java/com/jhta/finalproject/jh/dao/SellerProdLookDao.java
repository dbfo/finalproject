package com.jhta.finalproject.jh.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.jh.vo.SellerOldbooksVo;

@Repository
public class SellerProdLookDao {
	@Autowired
	private SqlSessionTemplate slqSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.SellerProdLookMapper.jh";
	
	public List<SellerOldbooksVo> allList(int snum){
		List<SellerOldbooksVo> list=slqSession.selectList(NAMESPACE+".prodAllSelect", snum);
		return list;
	}
}
