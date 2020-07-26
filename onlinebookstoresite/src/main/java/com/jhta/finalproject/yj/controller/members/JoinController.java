package com.jhta.finalproject.yj.controller.members;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.finalproject.yj.service.MembersService;
import com.jhta.finalproject.yj.vo.MembersVO;

@Controller
public class JoinController {
	@Autowired
	private MembersService service;

	@GetMapping("/join")
	public String join() {
		return ".join";
	}

	@PostMapping("/join")
	public String joinOk(HttpServletRequest req) {
		int n = 0;
		try {
			String mname = req.getParameter("mname");
			String mid = req.getParameter("mid");
			String mpwd = req.getParameter("mpwd");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String addr = req.getParameter("addr");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date birth = sdf.parse(req.getParameter("birth"));
			String sex = req.getParameter("sex");
			MembersVO vo = new MembersVO(0, mname, mid, mpwd, email, phone, addr, null, 0, 1, birth, sex);
			n = service.join(vo);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (n > 0) {
			return "/admin/success";
		} else {
			return "/admin/fail";
		}
	}
}
