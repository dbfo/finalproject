package com.jhta.finalproject.hd.vo;

public class OrderResultVo {
	private String btitle;
	private int bnum;
	private int bprice;
	private int bpoint;
	private int bshipinfo;
	private String imgsavefilename;
	private int cartNum;
	private int bcount;
	private String imgpath;
	private int totalpoint;
	private int totalvalue;
	public OrderResultVo() {}
	public OrderResultVo(String btitle, int bnum, int bprice, int bpoint, int bshipinfo, String imgsavefilename,
			int cartNum, int bcount, String imgpath, int totalpoint, int totalvalue) {
		super();
		this.btitle = btitle;
		this.bnum = bnum;
		this.bprice = bprice;
		this.bpoint = bpoint;
		this.bshipinfo = bshipinfo;
		this.imgsavefilename = imgsavefilename;
		this.cartNum = cartNum;
		this.bcount = bcount;
		this.imgpath = imgpath;
		this.totalpoint = totalpoint;
		this.totalvalue = totalvalue;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public int getBpoint() {
		return bpoint;
	}
	public void setBpoint(int bpoint) {
		this.bpoint = bpoint;
	}
	public int getBshipinfo() {
		return bshipinfo;
	}
	public void setBshipinfo(int bshipinfo) {
		this.bshipinfo = bshipinfo;
	}
	public String getImgsavefilename() {
		return imgsavefilename;
	}
	public void setImgsavefilename(String imgsavefilename) {
		this.imgsavefilename = imgsavefilename;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public int getTotalpoint() {
		return totalpoint;
	}
	public void setTotalpoint(int totalpoint) {
		this.totalpoint = totalpoint;
	}
	public int getTotalvalue() {
		return totalvalue;
	}
	public void setTotalvalue(int totalvalue) {
		this.totalvalue = totalvalue;
	}
	
	
}
