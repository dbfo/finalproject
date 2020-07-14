package com.jhta.finalproject.yr.vo;

public class BooksVO {
	private int bnum; 
	private String btitle; 
	private int bprice;
	
	public BooksVO() {
		super();
	}
	public BooksVO(int bnum, String btitle, int bprice) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.bprice = bprice;
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
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	@Override
	public String toString() {
		return "BooksVO [bnum=" + bnum + ", btitle=" + btitle + ", bprice=" + bprice + "]";
	} 	
}
