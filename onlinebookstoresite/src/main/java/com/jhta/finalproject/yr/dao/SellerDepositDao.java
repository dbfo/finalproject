package com.jhta.finalproject.yr.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yr.vo.DepositVo;
import com.jhta.finalproject.yr.vo.UsedOldBookSellerInfoVo;

@Repository
public class SellerDepositDao {
	@Autowired
	private SqlSessionTemplate session;
	private final String NAMESPACE = "com.jhta.yr.mybatis.mapper.UsedBookSellerMapper";
	
	public List<UsedOldBookSellerInfoVo> getList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".getList",map);
	}
	
	public int updateObcomplete(int bpaynum) {
		return session.update(NAMESPACE + ".updateObcomplete", bpaynum);
	}
	
	public int insertDeposit(DepositVo vo) {
		return session.insert(NAMESPACE + ".insertDeposit", vo);
	}
}
