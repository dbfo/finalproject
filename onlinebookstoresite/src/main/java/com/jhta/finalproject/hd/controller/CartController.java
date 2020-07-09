package com.jhta.finalproject.hd.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.hd.service.CartService;
import com.jhta.finalproject.hd.vo.CartListVo;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	@RequestMapping("/pay/cart")
	public String conCart() {
		return ".cart";
	}
	@RequestMapping(value="/pay/cartlist",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String cartlist(HttpSession session) {
		//세션에 들어있는 회원번호 받음.
		int mnum=Integer.parseInt(session.getAttribute("mnum").toString());
		String path=session.getAttribute("cp")+"/resources/image";
		System.out.println("컨트롤러안 mnum : "+mnum);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mnum", mnum);
		List<CartListVo> list=service.cartlist(map);
		JSONArray jarr=new JSONArray();
		for(CartListVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("mnum", vo.getMnum());
			json.put("bnum", vo.getBnum());
			json.put("btitle", vo.getBtitle());
			System.out.println("컨트롤러안 title : "+vo.getBtitle());
			String imgpath=path+"\\"+vo.getImgsavefilename();
			json.put("imgsrc", imgpath);
			json.put("bprice", vo.getBprice());
			json.put("bpoint", vo.getBpoint());
			json.put("bshipinfo", vo.getBshipinfo());
			json.put("stored", vo.getStored()); //재고 ( books 테이블 )
			json.put("bcount", vo.getBcount());
			jarr.put(json);
		}
		return jarr.toString();
		
	}
}
