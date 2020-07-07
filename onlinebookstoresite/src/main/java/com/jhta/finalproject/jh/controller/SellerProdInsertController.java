package com.jhta.finalproject.jh.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.jh.service.SellerInsertService;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;

@Controller
public class SellerProdInsertController {
	@Autowired
	private SellerInsertService service;
	
	@RequestMapping("/seller/prodInsert")
	public String insertProd(HttpServletRequest req) {
		//,MultipartFile img1,MultipartFile img2,MultipartFile img3,MultipartFile img4
//		int snum=1;//테스트용 중고판매자번호
//		System.out.println("큰카테고리"+req.getParameter("bcataname"));
		System.out.println("작은카테고리"+req.getParameter("scatename"));
		System.out.println("obname"+req.getParameter("obname"));
		System.out.println("obwriter"+req.getParameter("obwriter"));
		System.out.println("obpublisher"+req.getParameter("obpublisher"));
		System.out.println("date:"+req.getParameter("obpdate"));
		System.out.println("oborgprice"+req.getParameter("oborgprice"));
		System.out.println("obstatus"+req.getParameter("obstatus"));
		System.out.println("obsaleprice"+req.getParameter("obsaleprice"));
		System.out.println("배송료"+req.getParameter("obdelfee"));
		System.out.println("배송료2"+req.getParameter("obdelfee2"));
		System.out.println("img1"+req.getParameter("img1"));
		System.out.println("img2"+req.getParameter("img2"));
		System.out.println("img3"+req.getParameter("img3"));
		System.out.println("img4"+req.getParameter("img4"));
		System.out.println("addr1"+req.getParameter("addr1"));
		System.out.println("addr2"+req.getParameter("addr2"));
		System.out.println("addr3"+req.getParameter("addr3"));
		System.out.println("addr4"+req.getParameter("addr4"));
		System.out.println("addr5"+req.getParameter("addr5"));
		System.out.println("obdetail"+req.getParameter("obdetail"));
		//출고지주소
//		String selleraddr=req.getParameter("addr1")+"|"+req.getParameter("addr2")+"|"+req.getParameter("addr3")+"|"+
//				req.getParameter("addr4")+"|"+req.getParameter("addr5");
		
//		int scatenum=Integer.parseInt(req.getParameter("scatename"));
		
//		int obnum; //중고책번호
		SimpleDateFormat dformat=new SimpleDateFormat("yyyy-mm-dd");
		try {
			int snum=1;  //판매자번호
			String selleraddr=req.getParameter("addr1")+"|"+req.getParameter("addr2")+"|"+req.getParameter("addr3")+"|"+
					req.getParameter("addr4")+"|"+req.getParameter("addr5"); //출고주소
			String obname=req.getParameter("obname"); //책이름
			String obwriter=req.getParameter("obwriter"); //저자
			String obpublisher=req.getParameter("obpublisher"); //춣판사
			Date obpdate=dformat.parse(req.getParameter("obpdate")); //출간일
			int obstatus=Integer.parseInt(req.getParameter("obstatus")); //품질
			int oborgprice=Integer.parseInt(req.getParameter("oborgprice")); //정가
			int obsaleprice=Integer.parseInt(req.getParameter("obsaleprice"));  //판매가
			String obdetail=req.getParameter("obdetail"); //상품설명
			//배송료
			int obdelfee=0;
			if(req.getParameter("obdelfee2")!=null) {
					obdelfee=2500;
				}
			int scatenum=Integer.parseInt(req.getParameter("scatename")); //작은카테고리번호
			
			SellerOldbooksVo vo=new SellerOldbooksVo(0, snum, selleraddr, obname, obwriter, obpublisher, 
					obpdate, obstatus, oborgprice, obsaleprice, obdetail, obdelfee, 0, 0, scatenum);
			
			
			int n=service.insertProd(vo);
			System.out.println("결과:"+n);
		}catch(ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
