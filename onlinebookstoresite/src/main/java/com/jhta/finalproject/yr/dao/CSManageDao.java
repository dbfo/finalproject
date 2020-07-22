package com.jhta.finalproject.yr.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yr.vo.PaymentAndBookListVo;
import com.jhta.finalproject.yr.vo.PaymentAndCSBookListVo;
import com.jhta.finalproject.yr.vo.PaymentBooksVo;
import com.jhta.finalproject.yr.vo.PaymentVo;

@Repository
public class CSManageDao {
	
	@Autowired
	public SqlSessionTemplate session;
	
	private final String NAMESPACE = "com.jhta.yr.mybatis.mapper.CSMapper"; 
	
	public List<HashMap<String,Object>> getCSCount(){
		return session.selectList(NAMESPACE+".CSCount");
	}
	
	
	public List<PaymentAndCSBookListVo> paymentList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".paymentList",map);
	}
	
	public int cancelPaymentInsert(PaymentVo vo) {
		return session.insert(NAMESPACE + ".cancelPaymentInsert",vo);
	}
	
	public int paymentbooksInsert(PaymentBooksVo booksVo) {
		return session.insert(NAMESPACE + ".paymentbooksInsert", booksVo);
	}
	
	public int updateCancelStatus(int bpaynum) {
		return session.update(NAMESPACE+".updateCancelStatus",bpaynum);
	}

	public int updateRefundStatus(int bpaynum) {
		return session.update(NAMESPACE+".updateRefundStatus",bpaynum);
	}
	
	public int updateStatus(HashMap<String, Object> map) {
		return session.update(NAMESPACE+".updateStatus",map);
	}
}
