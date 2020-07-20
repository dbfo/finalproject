package com.jhta.finalproject.yj.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yj.vo.MembersListVO;

@Repository
public class MembersDao {
	@Autowired
	private SqlSessionTemplate session;
	private final String NAMESPACE = "com.jhta.yj.mybatis.mapper.MembersMapper";

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	public int memCount(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE + ".memCount", map);
	}

	public List<MembersListVO> memList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE + ".memList", map);
	}
	

	public int ghostCount(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE + ".ghostCount", map);
	}

	public List<MembersListVO> ghostList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE + ".ghostList", map);
	}
}
