package com.jhta.finalproject.jh.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.jh.service.SellerBoardService;
import com.jhta.finalproject.jh.vo.SellerImgVo;
import com.jhta.finalproject.jh.vo.SellerObqanswerVo;
import com.jhta.finalproject.jh.vo.SellerQnaListJoinVo;

@Controller
public class SellerBoardConteoller {
	@Autowired
	private SellerBoardService service;
	
	//중고판매자 QnA리스트
	@RequestMapping("/seller/qnalist")
	public String sellerQnaList(Model model,HttpSession session) {
		int snum=(Integer)session.getAttribute("snum");
		List<SellerQnaListJoinVo> list=service.getSellerQnaList(snum);//문의글리스트
		model.addAttribute("list", list);
		return ".seller.qna";  
	}
	
	//중고 문의사항 상세페이지로 이동
	@RequestMapping("/seller/qnadetail")
	public String obQnaDetail(int obqnum,Model model) {
		SellerQnaListJoinVo qnaList=service.getSellerQnaDetail(obqnum); //문의사항
		SellerObqanswerVo answerList=service.getSellerAnswerList(obqnum); //답변
		
		SellerImgVo img=service.getQnaDetailImg(qnaList.getObnum());
		model.addAttribute("answerList", answerList);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("img", img);
		return ".seller.qnadetail";
	}
	
	//중고Qna답글달기 
	@RequestMapping("/seller/insertAnswer")
	@ResponseBody
	public String insertAnswer(int obqnum,String obqacontent,HttpSession session) {
		int snum=(Integer)session.getAttribute("snum");
		System.out.println("번호:"+obqnum);
		System.out.println("답글내용:"+obqacontent);
		try {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("snum",snum);
			map.put("obqnum",obqnum);
			map.put("obqacontent",obqacontent);
			int n=service.sellerQnaInsert(map);
			JSONObject json=new JSONObject();
			if(n>0) {
				json.put("code", "success");
			}else {
				json.put("code", "error");
			}
			return json.toString();
		}catch(Exception e){
			e.printStackTrace();
			return ".seller.insertfail";
		}
	}
}
