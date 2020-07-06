package com.jhta.finalproject.jh.vo;

public class SellerSmallcategoryVo {
	private int scatenum;
	private int bcatenum;
	private String scatename;
	
	public SellerSmallcategoryVo() {}
	
	public SellerSmallcategoryVo(int scatenum, int bcatenum, String scatename) {
		super();
		this.scatenum = scatenum;
		this.bcatenum = bcatenum;
		this.scatename = scatename;
	}
	public int getScatenum() {
		return scatenum;
	}
	public void setScatenum(int scatenum) {
		this.scatenum = scatenum;
	}
	public int getBcatenum() {
		return bcatenum;
	}
	public void setBcatenum(int bcatenum) {
		this.bcatenum = bcatenum;
	}
	public String getScatename() {
		return scatename;
	}
	public void setScatename(String scatename) {
		this.scatename = scatename;
	}
}
