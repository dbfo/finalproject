package com.jhta.finalproject.hd.controller;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.hd.service.OrderManagerService;
import com.jhta.finalproject.hd.vo.refundBookVo;

@Controller
public class OrderManagerController {
	@Autowired
	private OrderManagerService service;
	
	@RequestMapping(value="/order/manage",method = RequestMethod.POST)
	@ResponseBody
	public String orderManage(int bpaynum,int bstatus,String apply) {
		System.out.println("컨트롤러 bstatus : "+bstatus);
		System.out.println("컨트롤러 bpaynum : "+bpaynum);
		System.out.println("컨트롤러 apply : "+apply);
		try {
			JSONObject json=new JSONObject();
			boolean result=false;
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("bpaynum", bpaynum);
			map.put("bstatus", bstatus);
			map.put("apply",apply);
			if(bstatus==0) { //주문전체취소할때
				int n=service.orderCancel(map);
				if(n>0) {
					result=true;
				}
			}else {
				List<refundBookVo>list=service.getpaymentbook(map);
				System.out.println("list사이즈 :"+list.size());
				map.put("list",list);
				int n=service.orderapply(map);	
				if(n==1) {
					result=true;
				}
			}
			json.put("result", result);
			return json.toString();
		}catch(Exception e) {
			JSONObject json=new JSONObject();
			boolean result=false;
			json.put("result", result);
			return json.toString();
		}
	}
	
}
