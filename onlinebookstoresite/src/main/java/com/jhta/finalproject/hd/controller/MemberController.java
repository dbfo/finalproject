package com.jhta.finalproject.hd.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.finalproject.hd.service.MemberService;
import com.jhta.finalproject.hd.vo.LoginCheckVo;
import com.jhta.finalproject.jh.service.MembersPointService;
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MembersPointService pointService;
	
	//로그인화면으로 이동..
		@RequestMapping("/login")
		public String moveloginPage() {
			return "heedo/login/login";
		}
		//로그인 jsp에서 로그인눌렀을때..
		@PostMapping("/loginCheck")
		@ResponseBody
		public String loginCheck(HttpSession session,String id,String pwd) {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("id", id);
			map.put("pwd",pwd);
			String result="success";
			LoginCheckVo vo=service.membercheck(map);
			if(vo==null) {
				result="fail";
			}else if(vo.getSnum()!=0){  //snum이 있으면 세션에 저장함.
				session.setAttribute("mnum", vo.getMnum());
				session.setAttribute("mid", vo.getMid());
				session.setAttribute("snum", vo.getSnum());
				session.setAttribute("point", pointService.getTotPoint(Integer.parseInt(vo.getMnum())));//포인트 세션에 저장
				session.setAttribute("grade", pointService.getGrade(Integer.parseInt(vo.getMnum())));//등급 세션에 저장
			}else {
				session.setAttribute("mnum", vo.getMnum());
				session.setAttribute("mid", vo.getMid());
				session.setAttribute("point", pointService.getTotPoint(Integer.parseInt(vo.getMnum())));//포인트 세션에 저장
				session.setAttribute("grade", pointService.getGrade(Integer.parseInt(vo.getMnum())));//등급 세션에 저장
			}
			JSONObject json=new JSONObject();
			json.put("result", result);
			return json.toString();
		}
		//로그아웃버튼 클릭시.
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
}
