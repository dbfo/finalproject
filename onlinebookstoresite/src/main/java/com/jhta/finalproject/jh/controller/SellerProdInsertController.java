package com.jhta.finalproject.jh.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerProdInsertController {
	@RequestMapping("/seller/prodInsert")
	public String insertProd(HttpServletRequest req) {
		System.out.println("큰카테고리"+req.getParameter("bcataname"));
		System.out.println("작은카테고리"+req.getParameter("scatename"));
		System.out.println("obname"+req.getParameter("obname"));
		System.out.println("obwriter"+req.getParameter("obwriter"));
		System.out.println("obpublisher"+req.getParameter("obpublisher"));
		System.out.println("date:"+req.getParameter("date"));
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
		return null;
	}
}
