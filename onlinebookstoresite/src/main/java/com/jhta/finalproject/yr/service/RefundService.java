package com.jhta.finalproject.yr.service;

import java.util.List;

public interface RefundService {
	int updateSestausAndDecreaseDeposit(List<Integer> senum, 
			List<Integer> mnum, List<Integer> priceArr);
}
