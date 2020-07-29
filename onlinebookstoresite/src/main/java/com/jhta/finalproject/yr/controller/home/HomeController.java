package com.jhta.finalproject.yr.controller.home;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.yj.service.QnaService;
import com.jhta.finalproject.yr.service.CSManageService;
import com.jhta.finalproject.yr.service.PaymentService;
import com.jhta.finalproject.yr.service.SalesService;
import com.jhta.finalproject.yr.vo.MethodPaymentInfoVo;

@Controller
public class HomeController {
	
	@Autowired
	private CSManageService csservice;
	@Autowired
	private PaymentService pservice;	
	@Autowired
	private SalesService sservice;
	@Autowired
	private QnaService qnaservice;
	
	@RequestMapping("/")
	public String goHome(Model model) {
		
		int cscount = csservice.getTodayCSCount();
		int ordercount = pservice.getTodayOrderCount();
		int paymentcount = pservice.getTodayPaymentCount();
		int qnacount = qnaservice.unAnswerCount();
		List<MethodPaymentInfoVo> mivo = sservice.getThreeDayMethodpaymentInfo();
		List<String> days = getThreeDate(); 
		
		model.addAttribute("cscount", cscount);
		model.addAttribute("ordercount", ordercount);
		model.addAttribute("paymentcount", paymentcount);
		model.addAttribute("qnacount", qnacount);
		model.addAttribute("mivo", mivo);
		model.addAttribute("days", days);
	
		return ".main";
	}
	
	public List<String> getThreeDate(){

		List<String> result = new ArrayList<String>();
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//        System.out.println("current: " + df.format(cal.getTime()));
        result.add(df.format(cal.getTime()));
        
        for (int i = 1; i <= 2 ; i++) {
        	cal.add(Calendar.DATE, -1);
        	result.add(df.format(cal.getTime()));
		}
        
		return result;
	}
	
}
