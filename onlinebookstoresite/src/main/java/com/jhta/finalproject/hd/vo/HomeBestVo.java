package com.jhta.finalproject.hd.vo;

public class HomeBestVo {
	private int bnum;
	private String btitle;
	private String bwriter;
	private String bpublisher;
	private int bprice;
	private String imgsavefilename;
	public HomeBestVo() {}
	public HomeBestVo(int bnum, String btitle, String bwriter, String bpublisher, int bprice, String imgsavefilename) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bpublisher = bpublisher;
		this.bprice = bprice;
		this.imgsavefilename = imgsavefilename;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBpublisher() {
		return bpublisher;
	}
	public void setBpublisher(String bpublisher) {
		this.bpublisher = bpublisher;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public String getImgsavefilename() {
		return imgsavefilename;
	}
	public void setImgsavefilename(String imgsavefilename) {
		this.imgsavefilename = imgsavefilename;
	}
	
	
}
