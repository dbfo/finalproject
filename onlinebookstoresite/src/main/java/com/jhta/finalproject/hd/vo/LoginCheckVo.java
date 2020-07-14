package com.jhta.finalproject.hd.vo;

// 로그인시 사용함. 
public class LoginCheckVo {
	private int mnum;
	private String mid;
	private int snum; //중고판매자번호. NVL사용으로 판매자번호가 없으면 0번들어감.
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
