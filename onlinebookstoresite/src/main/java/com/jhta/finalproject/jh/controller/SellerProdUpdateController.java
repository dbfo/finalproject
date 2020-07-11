package com.jhta.finalproject.jh.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.finalproject.jh.service.SellerInsertService;
import com.jhta.finalproject.jh.service.SellerProdLookService;
import com.jhta.finalproject.jh.vo.SellerBigcategoryVo;
import com.jhta.finalproject.jh.vo.SellerImgVo;
import com.jhta.finalproject.jh.vo.SellerOldbooksVo;
import com.jhta.finalproject.jh.vo.SellerSmallcategoryVo;

@Controller
public class SellerProdUpdateController {
	@Autowired
	private SellerProdLookService lookService;
	@Autowired
	private SellerInsertService insertService;

	// 기존 정보를 가지고 수정할 페이지로 이동하는 메소드
	@RequestMapping("/seller/prodUpdateView")
	public String prodUpdateView(Model model, int obnum) {
		try {
			SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");// 날짜형식 지정
			List<SellerBigcategoryVo> list = insertService.getBigcate();
			List<SellerOldbooksVo> prodList = lookService.prodUpdateSelect(obnum);//수정할 상품 정보
			List<SellerImgVo> imgList=lookService.getProdImgList(obnum);//이미지
			int bcatenum = lookService.getBiccatenum(obnum);
			List<SellerSmallcategoryVo> smallList = insertService.getSmallcate(bcatenum);
			int scatenum = prodList.get(0).getScatenum();
			//-------------------------------------------------------
			//주소api사용한 부분 문자열 나누기
			String addrStr=prodList.get(0).getSelleraddr();
			String[] arr=addrStr.split("\\|");
			// ----------------기존 파라미터값들 보내주기-------------------
			model.addAttribute("obnum", obnum);//상품번호
			model.addAttribute("list", list);// 큰카테고리 리스트
			model.addAttribute("slist", smallList);// 작은 카테고리 리스트
			model.addAttribute("bbcatenum", bcatenum);// 기존 큰카테고리
			model.addAttribute("sscatenum", scatenum);// 기존 작은 카테고리
			model.addAttribute("getObname", prodList.get(0).getObname());// 기존도서명
			model.addAttribute("getObwriter", prodList.get(0).getObwriter());// 기존저자
			model.addAttribute("getObpublisher", prodList.get(0).getObpublisher());// 기존출판사
			model.addAttribute("getObpdate", dformat.format(prodList.get(0).getObpdate()));// 기존출간일
			model.addAttribute("getOborgprice", prodList.get(0).getOborgprice());// 기존정가
			model.addAttribute("getObstatus", prodList.get(0).getObstatus());// 기존품질
			model.addAttribute("getObsaleprice", prodList.get(0).getObsaleprice());// 기존판매가
			model.addAttribute("getObdelfee", prodList.get(0).getObdelfee());//택배비
			model.addAttribute("addr1", arr[0]);//주소1
			model.addAttribute("addr2", arr[1]);//주소2
			model.addAttribute("addr3", arr[2]);//주소3
			model.addAttribute("addr4", arr[3]);//주소4
			model.addAttribute("addr5", arr[4]);//주소5
			model.addAttribute("getObdetail", prodList.get(0).getObdetail());//상품상세설명
			model.addAttribute("imgList", imgList);//등록한 이미지 리스트
			return ".seller.prodUpdateView";
		} catch (Exception e) {
			e.printStackTrace();
			return ".seller.insertfail";
		}
	}
	
	//상품 수정하는 메소드
	@RequestMapping("/seller/updateOldbook")
	public String updateOldbook(HttpServletRequest req,HttpSession session,MultipartFile updateImg1,
			MultipartFile updateImg2,MultipartFile updateImg3,MultipartFile updateImg4) {
		try {
			SimpleDateFormat dformat=new SimpleDateFormat("yyyy-MM-dd");//날짜형식 지정
			//-----------------------수정할 객체 담기(수정한 이미지 없을 경우)------------------------
			if(updateImg1.isEmpty() && updateImg2.isEmpty() && updateImg3.isEmpty() && updateImg4.isEmpty()) {
				String selleraddr=req.getParameter("addr1")+"|"+req.getParameter("addr2")+"|"+req.getParameter("addr3")+"|"+
						req.getParameter("addr4")+"|"+req.getParameter("addr5"); //출고주소
				int obdelfee=Integer.parseInt(req.getParameter("obdelfee"));//배송료
				String obname=req.getParameter("obname"); //책이름
				String obwriter=req.getParameter("obwriter"); //저자
				String obpublisher=req.getParameter("obpublisher"); //출판사
				Date obpdate=dformat.parse(req.getParameter("obpdate")); //출간일 
				int obnum=Integer.parseInt(req.getParameter("obnum"));
				int obstatus=Integer.parseInt(req.getParameter("obstatus")); //품질
				int oborgprice=Integer.parseInt(req.getParameter("oborgprice")); //정가
				int obsaleprice=Integer.parseInt(req.getParameter("obsaleprice"));  //판매가
				int scatenum=Integer.parseInt(req.getParameter("scatename"));  //판매가
				String obdetail=req.getParameter("obdetail"); //상품설명
				SellerOldbooksVo vo=new SellerOldbooksVo(obnum, 0, selleraddr, obname, obwriter, obpublisher, obpdate, 
						obstatus, oborgprice, obsaleprice, obdetail, obdelfee, 0, 0, scatenum, null);
				lookService.oldbookUpdate(vo);
				return ".seller.insertok";
			}else {
				//----------------수정한 이미지가 있는 경우-------------------------------------
				return null;
			}
		}catch (ParseException e) {
			e.printStackTrace();
			return ".seller.insertfail";
		}
	}
	
	//이미지삭제하는 메소드
	@RequestMapping("/seller/delimg")
	@ResponseBody
	public void delimg(int imgnum,HttpSession session) {
		System.out.println("이미지넘:"+imgnum);
		SellerImgVo vo= lookService.getdelImginfo(imgnum);
		String delname=vo.getImgsavefilename();
		String uploadpath=session.getServletContext().getRealPath("/resources/jh/jhobupload");
		File file=new File(uploadpath+"\\"+delname);
		file.delete();//파일삭제
		int n=lookService.delimg(imgnum);//이미지삭제
		JSONObject json=new JSONObject();
		if(n>0) {
			json.put("code", "success");
		}else {
			json.put("code", "error");
		}
	}
}
