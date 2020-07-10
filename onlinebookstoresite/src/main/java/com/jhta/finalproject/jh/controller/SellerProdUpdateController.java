package com.jhta.finalproject.jh.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.transform.impl.AddStaticInitTransformer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.jh.service.SellerInsertService;
import com.jhta.finalproject.jh.service.SellerProdLookService;
import com.jhta.finalproject.jh.vo.SellerBigcategoryVo;
import com.jhta.finalproject.jh.vo.SellerImgVo;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;
import com.jhta.finalproject.jh.vo.SellerSmallcategoryVo;

@Controller
public class SellerProdUpdateController {
	@Autowired
	private SellerProdLookService lookService;
	@Autowired
	private SellerInsertService insertService;

	// 기존 정보를 가지고 수정할 페이지로 이동하는 메소드
	@RequestMapping("/seller/prodUpdateView")
	public String prodUpdateView(Model model, int obnum) {
		try {
			SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");// 날짜형식 지정
			List<SellerBigcategoryVo> list = insertService.getBigcate();
			List<SellerOldbooksVo> prodList = lookService.prodUpdateSelect(obnum);
//			SellerOldbooksVo prodVo=prodList.get(0);
			int bcatenum = lookService.getBiccatenum(obnum);
			List<SellerSmallcategoryVo> smallList = insertService.getSmallcate(bcatenum);
			int scatenum = prodList.get(0).getScatenum();
			model.addAttribute("list", list);// 큰카테고리 리스트
			model.addAttribute("slist", smallList);// 작은 카테고리 리스트
//			model.addAttribute("prodList", prodVo);
			model.addAttribute("bbcatenum", bcatenum);// 기존 큰카테고리
			model.addAttribute("sscatenum", scatenum);// 기존 작은 카테고리
//			String obpdate=dformat.parse(d);
			//-----------이미지---------------------------------------
			List<SellerImgVo> imgList=lookService.getProdImgList(obnum);
			//-------------------------------------------------------
			//주소api사용한 부분 문자열 나누기
			String addrStr=prodList.get(0).getSelleraddr();
			String[] arr=addrStr.split("\\|");
			// ----------------기존 파라미터값들 보내주기-------------------
			model.addAttribute("getObname", prodList.get(0).getObname());// 기존도서명
			model.addAttribute("getObwriter", prodList.get(0).getObwriter());// 기존저자
			model.addAttribute("getObpublisher", prodList.get(0).getObpublisher());// 기존출판사
			model.addAttribute("getObpdate", dformat.format(prodList.get(0).getObpdate()));// 기존출간일
			model.addAttribute("getOborgprice", prodList.get(0).getOborgprice());// 기존정가
			model.addAttribute("getObstatus", prodList.get(0).getObstatus());// 기존품질
			model.addAttribute("getObsaleprice", prodList.get(0).getObsaleprice());// 기존판매가
			model.addAttribute("getObdelfee", prodList.get(0).getObdelfee());//택배비
			model.addAttribute("addr1", arr[0]);//주소1
			model.addAttribute("addr2", arr[1]);//주소2
			model.addAttribute("addr3", arr[2]);//주소3
			model.addAttribute("addr4", arr[3]);//주소4
			model.addAttribute("addr5", arr[4]);//주소5
			model.addAttribute("getObdetail", prodList.get(0).getObdetail());//상품상세설명
			model.addAttribute("imgList", imgList);
			return ".seller.prodUpdateView";
		} catch (Exception e) {
			e.printStackTrace();
			return ".seller.insertfail";
		}
	}
}
