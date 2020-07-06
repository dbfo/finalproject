package com.jhta.finalproject.jh.vo;

public class SellerBigcategoryVo {
	private int bcatenum;
	private String bcatename;
	public SellerBigcategoryVo() {}
	
	public SellerBigcategoryVo(int bcatenum, String bcatename) {
		super();
		this.bcatenum = bcatenum;
		this.bcatename = bcatename;
	}

	public int getBcatenum() {
		return bcatenum;
	}
	public void setBcatenum(int bcatenum) {
		this.bcatenum = bcatenum;
	}
	public String getBcatename() {
		return bcatename;
	}
	public void setBcatename(String bcatename) {
		this.bcatename = bcatename;
	}
	
}
