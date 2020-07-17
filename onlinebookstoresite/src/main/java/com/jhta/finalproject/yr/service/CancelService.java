package com.jhta.finalproject.yr.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jhta.finalproject.yr.vo.PaymentBooksVo;
import com.jhta.finalproject.yr.vo.PaymentVo;

@Service
public interface CancelService {
	int makeCancelPayment(PaymentVo vo, List<PaymentBooksVo> booklist);
}
