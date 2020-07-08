package com.jhta.finalproject.jh.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.jh.service.SellerInsertService;
import com.jhta.finalproject.jh.vo.SellerImgVo;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;
@Transactional
@Controller
public class SellerProdInsertController {
	@Autowired
	private SellerInsertService service;
	
	@RequestMapping("/seller/prodInsert")
	public String insertProd(HttpServletRequest req,HttpSession session, MultipartFile img1,
			MultipartFile img2,MultipartFile img3,MultipartFile img4) {
		//,MultipartFile img1,MultipartFile img2,MultipartFile img3,MultipartFile img4
		/*
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
		System.out.println("addr1"+req.getParameter("addr1"));
		System.out.println("addr2"+req.getParameter("addr2"));
		System.out.println("addr3"+req.getParameter("addr3"));
		System.out.println("addr4"+req.getParameter("addr4"));
		System.out.println("addr5"+req.getParameter("addr5"));
		System.out.println("obdetail"+req.getParameter("obdetail"));
		*/
		System.out.println("img1"+req.getParameter("img1"));
		System.out.println("img2"+req.getParameter("img2"));
		System.out.println("img3"+req.getParameter("img3"));
		System.out.println("img4"+req.getParameter("img4"));
		SimpleDateFormat dformat=new SimpleDateFormat("yyyy-mm-dd");//날짜형식 지정
		try {
			int snum=1;  //판매자번호(테스트용) 추후 로그인 후 세션에서 받아올 예정
			//출고주소(입력칸 나눠져 있는 부분 병합해서 저장)
			String selleraddr=req.getParameter("addr1")+"|"+req.getParameter("addr2")+"|"+req.getParameter("addr3")+"|"+
					req.getParameter("addr4")+"|"+req.getParameter("addr5"); 
			String obname=req.getParameter("obname"); //책이름
			String obwriter=req.getParameter("obwriter"); //저자
			String obpublisher=req.getParameter("obpublisher"); //출판사
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
			
//			int obnum=service.getObnum();//이미지등록을 위한 중고책번호 가져오기
//			System.out.println("중고책등록번호:"+obnum);//ok
			
			//파일 업로드를 위한 작업(썸네일)
			String upload=session.getServletContext().getRealPath("/resources/jhobupload");
			String orgFileName1=img1.getOriginalFilename();
			String saveFileName1=UUID.randomUUID()+"_"+orgFileName1;
			InputStream fis=img1.getInputStream();
			FileOutputStream fos=
					new FileOutputStream(upload+"\\"+saveFileName1);
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
			SellerImgVo img1vo=new SellerImgVo(orgFileName1, 0, saveFileName1, 0, 0, 0);
//			int j=service.insertObimgThum(img1vo);
//			System.out.println("이미지업로드 결과:"+j);
			int scatenum=Integer.parseInt(req.getParameter("scatename")); //작은카테고리번호
			SellerOldbooksVo vo=new SellerOldbooksVo(0, snum, selleraddr, obname, obwriter, obpublisher, 
					obpdate, obstatus, oborgprice, obsaleprice, obdetail, obdelfee, 0, 0, scatenum);
			
			int n=service.insertProd(vo,img1vo);//중고책등록
			System.out.println("결과:"+n);
			if(!(img2.isEmpty())) {
				
			}
		}catch(ParseException e) {
			e.printStackTrace();
		}catch(IOException ie) {
			ie.printStackTrace();
		}
		return ".seller.insertok";
	}
}
