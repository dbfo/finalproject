package com.jhta.finalproject.hd.controller;

import java.sql.Array;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	//장바구니 리스트 출력 AJAX
	@RequestMapping(value="/pay/cartlist",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String cartlist(HttpSession session) {
		//세션에 들어있는 회원번호 받음.
		int mnum=Integer.parseInt(session.getAttribute("mnum").toString());
		String path=session.getAttribute("cp")+"/resources/image";
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mnum", mnum);
		List<CartListVo> list=service.cartlist(map);
		JSONArray jarr=new JSONArray();
		for(CartListVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("cartnum", vo.getCartnum());
			json.put("mnum", vo.getMnum());
			json.put("bnum", vo.getBnum());
			json.put("btitle", vo.getBtitle());
			String imgpath=path+"\\"+vo.getImgsavefilename();
			json.put("imgsrc", imgpath);
			json.put("bprice", vo.getBprice());
			json.put("bpoint", vo.getBpoint());
			json.put("bshipinfo", vo.getBshipinfo());
			json.put("stored", vo.getStored()); //재고 ( books 테이블 )
			json.put("bcount", vo.getBcount());
			int totalvalue=vo.getBprice()*vo.getBcount();
			json.put("totalvalue", totalvalue);
			jarr.put(json);
		}
		return jarr.toString();
	}
	//장바구니에서 하나삭제 AJAX
	@RequestMapping("/pay/deleteOneCart")
	@ResponseBody
	public String deleteOne(int cartNum) {
		int n=service.deleteOne(cartNum);
		String result="fail";
		if(n>0) {
			result="success";
		}
		JSONObject json=new JSONObject();
		json.put("result", result);
		return json.toString();	
	}
	//수량변경 AJAX
	@RequestMapping("/pay/changeCount")
	@ResponseBody
	public String changeCount(int cartNum,int newCount) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("newCount", newCount);
		map.put("cartNum", cartNum);
		int n=service.changeCount(map);
		String result="fail";
		if(n>0) {
			result="success";
		}
		JSONObject json=new JSONObject();
		json.put("result", result);
		return json.toString();	
	}
	//
	@PostMapping("/pay/deleteSelectCart")
	@ResponseBody
	public String deleteSelectCart(@RequestParam(value="cartNumlist[]")List<Integer>cartNumlist) {
		String result="success";
		if(cartNumlist.size()==0) {
			result="fail";
		}else {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("list", cartNumlist);
			int n=service.deleteSelected(map);
			if(n<=0) {
				result="fail";
			}
		}
		JSONObject json=new JSONObject();
		json.put("result", result);
		
		return json.toString();
	}
}
