package com.jhta.finalproject.hd.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.hd.vo.CartListVo;

@Repository
public class CartDao {
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE="mybatis.mapper.CartMapper";
	
	//��ٱ��� ����Ʈ ��� dao
	public List<CartListVo> cartlist(HashMap<String, Object> map){
		return sqlsession.selectList(NAMESPACE+".cartlist", map);
	}
	//��ٱ��� �ϳ����� dao
	public int deleteOne(int cartNum) {
		return sqlsession.delete(NAMESPACE+".deleteOne", cartNum);
	}
	//��ٱ��� �������� dao
	public int changeCount(HashMap<String, Object>map) {
		return sqlsession.update(NAMESPACE+".changeCount", map);
	}
	//��ٱ��� �����Ѱ� ���� dao
	public int deleteSelected(HashMap<String,Object>map) {
		return sqlsession.delete(NAMESPACE+".deleteSelected", map);
	}
}
