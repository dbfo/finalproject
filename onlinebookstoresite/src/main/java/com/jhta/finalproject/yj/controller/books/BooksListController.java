package com.jhta.finalproject.yj.controller.books;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.finalproject.yj.service.BooksService;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;

@Controller
public class BooksListController {
	@Autowired
	private BooksService service;

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

		List<ImgVO> imgList = service.previewImg(bnum);
//		for (int i = 0; i < imgList.size(); i++) {
//			int thumbnail= imgList.get(0).getThumbnail();
//			int img= imgList.get(1).getThumbnail();
//			System.out.println("섬네일:" + imgList.get(0).getThumbnail());
//			System.out.println("일반이미지:" + imgList.get(1).getThumbnail());
//		}

		vo.setBcontent(bcontent);
		model.addAttribute("vo", vo);
		model.addAttribute("thub", imgList.get(0));
		model.addAttribute("img", imgList.get(1));
		return ".booksPreview";
	}
}
