package com.jhta.finalproject.hd.vo;

public class LoginCheckVo {
	private int mnum;
	private String mid;
	private int snum;
	public LoginCheckVo() {}
	public LoginCheckVo(int mnum, String mid, int snum) {
		super();
		this.mnum = mnum;
		this.mid = mid;
		this.snum = snum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	
}
