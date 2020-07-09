package com.jhta.finalproject.jh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.jh.service.SellerInsertService;
import com.jhta.finalproject.jh.service.SellerProdLookService;
import com.jhta.finalproject.jh.vo.SellerBigcategoryVo;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;

@Controller
public class SellerProdUpdateController {
	@Autowired
	private SellerProdLookService lookService;
	@Autowired
	private SellerInsertService insertService;
	
	//수정할 페이지로 이동하는 메소드
	@RequestMapping("/seller/prodUpdateView")
	public String prodUpdateView(Model model,int obnum) {
		List<SellerBigcategoryVo> list=insertService.getBigcate();
		List<SellerOldbooksVo> prodList=lookService.prodUpdateSelect(obnum);
		SellerOldbooksVo prodVo=prodList.get(0);
		int bcatenum=lookService.getBiccatenum(obnum);
		int scatenum=prodList.get(0).getScatenum();
		System.out.println("큰카테"+bcatenum);
		model.addAttribute("list", list);
//		model.addAttribute("prodList", prodVo);
		model.addAttribute("bbcatenum", bcatenum);
		model.addAttribute("sscatenum", scatenum);
		return ".seller.prodUpdateView";
	}
	
}
