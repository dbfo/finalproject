package com.jhta.finalproject.jh.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.jh.vo.SellerObqanswerVo;
import com.jhta.finalproject.jh.vo.SellerQnaListJoinVo;

@Repository
public class SellerBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.SellerBoardMapper.jh";
	
	//중고판매자 Qna리스트 가져오기
	public List<SellerQnaListJoinVo> getSellerQnaList(int snum){
		List<SellerQnaListJoinVo> list= sqlSession.selectList(NAMESPACE+".getSellerQnaList", snum);
		return list;
	}
	//중고판매자 답변 리스트 가져오기
	public List<SellerObqanswerVo> getSellerAnswerList(int snum){
		List<SellerObqanswerVo> list=sqlSession.selectList(NAMESPACE+".getSellerAnswerList", snum);
		return list;
	}
	//중고판매자 Qna상태 업데이트
	public int updateQnastatus(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".updateQnastatus", map);
	}
	//중고판매자 답글달기
	public int insertObqanswer(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".insertObqanswer", map);
	}
}
