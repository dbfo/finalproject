package com.jhta.finalproject.yr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.jhta.finalproject.yr.vo.UsedOldBookSellerInfoVo;

@Service
public interface SellerDepositService {
	List<UsedOldBookSellerInfoVo> getList(HashMap<String, Object> map);
	int updateSellerDepositStatus(List<Integer> bpanum,List<Integer> sellernum,List<Integer> price);
}
