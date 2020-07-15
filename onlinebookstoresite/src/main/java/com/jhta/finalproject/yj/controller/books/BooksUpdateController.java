package com.jhta.finalproject.yj.controller.books;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.finalproject.yj.service.BooksImgService;
import com.jhta.finalproject.yj.vo.BigCategoryVO;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;

@Controller
public class BooksUpdateController {
	@Autowired
	public BooksImgService service;

	@GetMapping("/booksUpdate")
	public String updateForm(int bnum, Model model) {
		BooksVO bvo = service.getBooksInfo(bnum);
		List<ImgVO> imgList = service.getImgInfo(bnum);
		if (imgList.size() == 2) { // 만약에 이미지가 두개일 경우 (그냥 이미지가 존재)
			model.addAttribute("img1", imgList.get(1));
		}
		
		List<BigCategoryVO> bigctgList = service.getBigctg();
		
		model.addAttribute("thumbImg", imgList.get(0));
		model.addAttribute("bvo", bvo);
		return ".booksUpdate";
	}
}
