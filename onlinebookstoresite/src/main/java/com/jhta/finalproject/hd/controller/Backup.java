package com.jhta.finalproject.hd.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

public class Backup {
	
	
//가상계좌로 결제신청..
@RequestMapping(value="/order/vbankcomplete",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
@ResponseBody
public String orderComplete_vbank(@RequestParam(value="cartNum")String[]cartNum, @RequestParam(value="bnum")String[]bnum,
							  @RequestParam(value="bcount")String[]bcount, @RequestParam(value="point")String[]point,
							  int usepoint,int totalpoint,int shipCharge,String shipaddr,int pay_price,int pay_price_noshipfee,
							  String receiver,String callnum,String method,String imp_uid,String vbank_due,
							  String vbank_name,String vbank_num,String vbank_holder,HttpSession session) {
	int mnum=0;
	String smnum=(String)session.getAttribute("mnum");
	if(smnum!=null) {
		mnum=Integer.parseInt(smnum);
	}
	int orderprice=pay_price+usepoint;	
	Map<String, Object>map=new HashMap<String, Object>();
	map.put("mnum",mnum);
	if(cartNum[0]!="0") { //장바구니있는경우는 장바구니에서도 삭제해줘야하기때문에.
		map.put("cartNum",cartNum);
	}
	
	//가상계좌일때만 추가되는 map 값들
	if(method.equals("vbank")) {
		if(vbank_name=="") {
			vbank_name="케이뱅크";
		}
		map.put("vbank_name",vbank_name);
		map.put("vbank_holder",vbank_holder);
		map.put("vbank_num",vbank_num);
		System.out.println("은행이름 : "+vbank_name);
		System.out.println("계좌번호 : "+vbank_num);
		System.out.println("예금주 : "+vbank_holder);
	}
	//=====================
	map.put("bnum", bnum);
	map.put("bcount", bcount);
	map.put("point", point);
	map.put("usepoint",usepoint);
	map.put("totalpoint",totalpoint);
	map.put("shipCharge",shipCharge);
	map.put("shipaddr",shipaddr);
	map.put("pay_price", pay_price);
	map.put("pay_price_noshipfee", pay_price_noshipfee);
	map.put("pay_price", pay_price);
	map.put("method",method); //결제수단
	map.put("receiver",receiver);
	map.put("callnum",callnum);
	map.put("orderprice",orderprice);
	
	//HashMap<String, Object>resultmap=service.ordercomplete(map);
	JSONObject json=new JSONObject();
	//json.put("bpaynum", (int)resultmap.get("bpaynum"));
	json.put("method", method);
	return null;//json.toString();
}

}
