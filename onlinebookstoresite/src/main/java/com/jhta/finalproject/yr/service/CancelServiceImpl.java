package com.jhta.finalproject.yr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.finalproject.yr.dao.CSManageDao;
import com.jhta.finalproject.yr.vo.PaymentBooksVo;
import com.jhta.finalproject.yr.vo.PaymentVo;

@Service
public class CancelServiceImpl implements CancelService{
	
	@Autowired
	private CSManageDao dao;
	
	@Transactional
	@Override
	public int makeCancelPayment(PaymentVo vo, List<PaymentBooksVo> booklist) {
		dao.cancelPaymentInsert(vo);
		for (PaymentBooksVo booksVo : booklist) {
			dao.paymentbooksInsert(booksVo);			
		}
		return 1;
	}
	
	
	
}
