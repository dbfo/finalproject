package com.jhta.finalproject.jh.vo;

public class SellerPaymentbookVo {
	private int bpaynum;
	private int btype;
	private int bnum;
	private int bcount;
	
	public SellerPaymentbookVo() {}
	
	public SellerPaymentbookVo(int bpaynum, int btype, int bnum, int bcount) {
		super();
		this.bpaynum = bpaynum;
		this.btype = btype;
		this.bnum = bnum;
		this.bcount = bcount;
	}
	public int getBpaynum() {
		return bpaynum;
	}
	public void setBpaynum(int bpaynum) {
		this.bpaynum = bpaynum;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	
}
