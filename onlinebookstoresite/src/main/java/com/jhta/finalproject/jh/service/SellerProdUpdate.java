package com.jhta.finalproject.jh.service;

import java.util.List;

import com.jhta.finalproject.jh.vo.SellerImgVo;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;

public interface SellerProdUpdate {
	int oldbookUpdate(SellerOldbooksVo vo);
	int oldbookAndImgUpdate(SellerOldbooksVo vo,List<SellerImgVo> list);
}
