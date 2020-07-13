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
	public String sellerProdLook(Model model,HttpServletRequest req,@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			@RequestParam(value="status",defaultValue = "")String status,@RequestParam(value="field",defaultValue = "")String field,
			@RequestParam(value="keyword",defaultValue = "")String keyword,@RequestParam(value="startDay",defaultValue = "")String startDay,
			@RequestParam(value="endDay",defaultValue = "")String endDay) {
		int snum=1;//판매자번호 추후 세션에서 받아오기
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("snum", snum);//판매자번호
		map.put("obsalestatus",req.getParameter("status"));
		map.put("startDay",req.getParameter("startDay"));
		map.put("endDay",req.getParameter("endDay"));
		map.put("field",req.getParameter("field"));
		map.put("keyword",req.getParameter("keyword"));
		
		int totalRowCount=service.oldbookPageCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5,3);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		
		List<SellerOldbooksVo> list=service.allList(map);
		
		System.out.println("판매상태:"+req.getParameter("status"));
		System.out.println("등록일자:"+req.getParameter("regdate"));
		System.out.println("시작일자:"+req.getParameter("startDay"));
		System.out.println("종료일자:"+req.getParameter("endDay"));
		System.out.println("검색필드:"+req.getParameter("field"));
		System.out.println("키워드:"+req.getParameter("keyword"));
		
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		
		
		return ".seller.prodLook";
	}
	
	
}
