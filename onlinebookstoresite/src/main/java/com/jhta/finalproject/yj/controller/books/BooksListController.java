package com.jhta.finalproject.yj.controller.books;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.yj.service.BooksImgService;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;

@Controller
public class BooksListController {
	@Autowired
	private BooksImgService service;

	@RequestMapping("/booksList")
	public ModelAndView showList() {
		ModelAndView mv = new ModelAndView();
		List<BooksVO> list = service.list();
		mv.addObject("list", list);
		mv.setViewName(".booksList");
		return mv;
	}

	@RequestMapping("/preview")
	public String preview(int bnum, Model model) {
		BooksVO vo = service.preview(bnum);
		String bcontent = vo.getBcontent();
		if (bcontent != null) {
			bcontent = bcontent.replace("\n", "<br>");
		}
		vo.setBcontent(bcontent);

		List<ImgVO> imgList = service.getImgInfo(bnum);

		if (imgList.size() == 2) { // 만약에 이미지가 두개일 경우
			model.addAttribute("imgVO2", imgList.get(1));

		}
		model.addAttribute("vo", vo);
		model.addAttribute("imgVO1", imgList.get(0));
		return ".booksPreview";
	}
}
