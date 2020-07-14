package com.jhta.finalproject.jh.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.finalproject.jh.service.SellerProdLookService;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;
import com.jhta.page.util.PageUtil;

@Controller
public class SellerProdLookController {
	@Autowired 
	private SellerProdLookService service;
	
	//========================중고상품 조회/수정페이지로 이동========================
	@RequestMapping("/seller/prodLook")
	public String sellerProdLook(Model model,HttpServletRequest req,
			@RequestParam(value="pageNum",defaultValue = "1")int pageNum, //페이지번호
			@RequestParam(value="obsalestatus",defaultValue = "3")int obsalestatus, //판매상태
			String field,
			String keyword,
			String startDay, //시작일
			String endDay, //종료일
			@RequestParam(value="regdate",defaultValue = "0")int regdate) {
		int snum=1;//판매자번호 추후 세션에서 받아오기
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("snum", snum);//판매자번호
		map.put("obsalestatus",obsalestatus);
		map.put("regdate", regdate);
		map.put("startDay",startDay);
		map.put("endDay",endDay);
		map.put("field",field);
		map.put("keyword",keyword);
		
		int totalRowCount=service.oldbookPageCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5,3);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		
		List<SellerOldbooksVo> list=service.allList(map);
//		System.out.println("============================================");
		System.out.println("★판매상태:"+obsalestatus);
//		System.out.println("등록일자 상태:"+req.getParameter("regdate"));
//		System.out.println("시작일자:"+req.getParameter("startDay"));
//		System.out.println("종료일자:"+req.getParameter("endDay"));
//		System.out.println("검색필드:"+req.getParameter("field"));
//		System.out.println("키워드:"+req.getParameter("keyword"));
//		System.out.println("★페이지번호"+pageNum);
//		System.out.println("스타트 row:"+pu.getStartRow());
//		System.out.println("endrow:"+pu.getEndRow());
//		System.out.println("한페이지에 보여질 글갯수:"+pu.getRowBlockCount());
		
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("map", map);
		
		
		return ".seller.prodLook";
	}
	
	
}
