package com.jhta.finalproject.yj.controller.members;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.yj.service.MembersService;
import com.jhta.finalproject.yj.vo.MembersListVO;

@Controller
public class MembersListController {
	@Autowired
	private MembersService service;

	// 일반회원
	@RequestMapping("/membersList")
	public ModelAndView memList() {
		ModelAndView mv = new ModelAndView();
		List<MembersListVO> list = service.memList();
		mv.addObject("list", list);
		mv.setViewName(".membersList");
		return mv;
	}

	// 탈퇴회원
	@RequestMapping("/ghostList")
	public ModelAndView ghostList() {
		ModelAndView mv = new ModelAndView();
		List<MembersListVO> list = service.ghostList();
		mv.addObject("list", list);
		mv.setViewName(".ghostList");
		return mv;
	}
}
