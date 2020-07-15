package com.jhta.finalproject.hd.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.hd.service.OrderService;
import com.jhta.finalproject.hd.vo.OrderListResultVo;
import com.jhta.finalproject.hd.vo.ShipmentInfoVo;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	// 바로 주문하기 눌렀을때  (( 책번호랑 몇개주문했는지 bcount 받아야함 )):
	@RequestMapping(value="/order/directorder")
	public String directOrder(HttpSession session,int bnum,int bcount,Model model) {
		String path=session.getAttribute("cp")+"/resources/hd/image";
		String smnum=(String)session.getAttribute("mnum");
		int mnum=0; //비회원 회원번호 0번으로 가정함.
		if(smnum!=null) {
			mnum=Integer.parseInt(smnum);
		}
		int totalprice=0;
		int totalpoint=0;
		OrderListResultVo vo=service.directorder(bnum);
		String imgpath=path+"\\"+vo.getImgsavefilename();
		int point=vo.getBpoint();
		int price=vo.getBprice();
		vo.setBcount(bcount);
		totalprice+=(price*bcount);
		totalpoint+=(point*bcount);
		vo.setTotalpoint(point*bcount);
		vo.setTotalvalue(price*bcount);
		vo.setImgpath(imgpath);
		List<OrderListResultVo> list=new ArrayList<OrderListResultVo>();
		list.add(vo);

		model.addAttribute("list", list);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("totalpoint", totalpoint);
		model.addAttribute("mnum",mnum);
		return ".order";
	}
	// 장바구니에서 주문하기 클릭했을때 처리함.
	@RequestMapping(value="/order/order",method = RequestMethod.POST)
	public String order(@RequestParam(value="cartNum")int[]cartNum,Model model,HttpSession session) {
		ArrayList<Integer> data=new ArrayList<Integer>(Arrays.stream(cartNum).boxed().collect(Collectors.toList()));
		//https://fblens.com/entry/JAVA-Array%EB%A5%BC-List%EB%A1%9C-List%EB%A5%BC-Array%EB%A1%9C
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("datalist", data);
		String path=session.getAttribute("cp")+"/resources/hd/image";
		List<OrderListResultVo> list=service.inputorderlist(map);
		int totalprice=0;
		int totalpoint=0;
		for(OrderListResultVo vo:list) {
			String imgpath=path+"\\"+vo.getImgsavefilename();
			int point=vo.getBpoint();
			int price=vo.getBprice();
			int bcount=vo.getBcount();
			totalprice+=(price*bcount);
			totalpoint+=(point*bcount);
			vo.setTotalpoint(point*bcount);
			vo.setTotalvalue(price*bcount);
			vo.setImgpath(imgpath);
		}
		model.addAttribute("list", list);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("totalpoint", totalpoint);
		return ".order";
	}
	
	//주문페이지에서 배송지 얻어옴.
	@RequestMapping(value="/order/getAddr",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getShipAddr(HttpSession session) {
		String smnum=(String)session.getAttribute("mnum");
		int mnum=0;
		if(smnum!=null) {
			mnum=Integer.parseInt(smnum);
		}
		JSONObject json=new JSONObject();
		String addr1="";
		String addr2="";
		String addr3="";
		String addr4="";
		String addr5="";
		String phone1="";
		String phone2="";
		String phone3="";
		String mname="";
		ShipmentInfoVo vo=null;
		if(mnum!=0) {
			vo=service.getAddr(mnum);
			//06000|서울 강남구 강남대로 708|서울 강남구 압구정동 386-1|z| (압구정동)
			String [] addrGroup=vo.getAddr().split("\\|");
			addr1=addrGroup[0]; //우편번호
			addr2=addrGroup[1]; // 도로명주소
			addr3=addrGroup[2]; // 지번주소
			addr4=addrGroup[3]; // 상세주소
			addr5=addrGroup[4]; // 참고주소
			
			String [] phoneGroup=vo.getPhone().split("-");
			phone1=phoneGroup[0];
			phone2=phoneGroup[1];
			phone3=phoneGroup[2];
			
			mname=vo.getMname();
		}
		json.put("addr1", addr1); 
		json.put("addr2", addr2);
		json.put("addr3", addr3);
		json.put("addr4", addr4);
		json.put("addr5", addr5);
		json.put("mname",mname);
		json.put("phone1", phone1);
		json.put("phone2", phone2);
		json.put("phone3", phone3);
		return json.toString();
	}
	//주문페이지에서 현재 사용가능한 포인트조회..
	@RequestMapping(value="/order/usablepoint",method=RequestMethod.POST)
	@ResponseBody
	public String usablepoint(HttpSession session) {
		String smnum=(String)session.getAttribute("mnum");
		int mnum=0;
		if(smnum!=null) {
			mnum=Integer.parseInt(smnum);
		}
		int point=service.getPoint(mnum);
		JSONObject json=new JSONObject();
		json.put("point", point);
		return json.toString();
	}
}
