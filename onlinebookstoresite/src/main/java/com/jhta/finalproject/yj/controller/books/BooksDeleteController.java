package com.jhta.finalproject.yj.controller.books;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.yj.service.BooksImgService;
import com.jhta.finalproject.yj.vo.ImgVO;

@Controller
public class BooksDeleteController {
	@Autowired
	public BooksImgService service;

	@RequestMapping("/booksDelete")
	public String imgDelete(int bnum, HttpSession session) {
		int n1 = service.booksDelete(bnum);
		List<ImgVO> imgList = service.getImgInfo(bnum);
		String uploadPath = session.getServletContext().getRealPath("/resources/imgUpload");
		for (int i = 0; i < imgList.size(); i++) {
			File file = new File(uploadPath + "\\" + imgList.get(i).getImgsavefilename());
			file.delete();
		}
		int n2 = service.imgDelete(bnum);
//		return "redirect:/booksList";
		if (n1 > 0 && n2 > 0) {
			return "/admin/success";
		} else {
			return "/admin/fail";
		}
	}
}
