package com.jhta.finalproject.hd.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.hd.vo.LoginCheckVo;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE="mybatis.mapper.MemberMapper";
	
	public LoginCheckVo membercheck(HashMap<String, Object>map) {
		return sqlsession.selectOne(NAMESPACE+".memberCheck", map);
	}
}
